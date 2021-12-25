import NIO

final class AmbiguousPNGCompressor: ZlibCompressor {
    override func deflate(from: inout ByteBuffer, to: inout ByteBuffer) throws {
        try startStream()
        try streamDeflate(from: &from, to: &to, flush: .full)
        try finishDeflate(to: &to)
        try finishStream()
    }
}
