//
//  ContentView.swift
//  Skyflow
//
//  Created by Florian N on 04/05/2026.

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = TimerViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Header
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("SKYFLOW")
                        .font(.system(size: 11, weight: .semibold))
                        .kerning(3)
                        .foregroundStyle(.secondary)
                    Text("Focus Session")
                        .font(.system(size: 22, weight: .light))
                        .foregroundStyle(.primary)
                }
                Spacer()
                Text("FL250")
                    .font(.system(size: 11, weight: .medium, design: .monospaced))
                    .foregroundStyle(.secondary)
                    .kerning(1)
            }
            .padding(.horizontal, 32)
            .padding(.top, 64)
            
            Spacer()
            
            // MARK: - Timer Ring
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                    .frame(width: 260, height: 260)
                
                Circle()
                    .trim(from: 0, to: viewModel.progress)
                    .stroke(Color.primary, style: StrokeStyle(lineWidth: 1, lineCap: .round))
                    .frame(width: 260, height: 260)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: viewModel.progress)
                
                VStack(spacing: 6) {
                    Text(viewModel.formattedTime)
                        .font(.system(size: 52, weight: .thin))
                        .kerning(-1)
                        .foregroundStyle(.primary)
                        .monospacedDigit()
                    
                    Text("DEEP FOCUS")
                        .font(.system(size: 9, weight: .medium))
                        .kerning(3)
                        .foregroundStyle(.tertiary)
                }
            }
            
            Spacer()
            
            // MARK: - Controls
            VStack(spacing: 12) {
                Button {
                    viewModel.isRunning ? viewModel.stop() : viewModel.start()
                } label: {
                    Text(viewModel.isRunning ? "ABORT" : "TAKE OFF")
                        .font(.system(size: 12, weight: .medium))
                        .kerning(2.5)
                        .foregroundStyle(viewModel.isRunning ? .secondary : .primary)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(viewModel.isRunning ? Color.gray.opacity(0.3) : Color.primary, lineWidth: 0.5)
                        )
                }
                
                Button {
                    viewModel.reset()
                } label: {
                    Text("RESET")
                        .font(.system(size: 11, weight: .regular))
                        .kerning(2)
                        .foregroundStyle(.tertiary)
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 52)
        }
    }
}

#Preview {
    ContentView()
}
