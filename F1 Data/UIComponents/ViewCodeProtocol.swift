import Foundation

protocol ViewCodeProtocol {
    func setupViewCodeComponent()
    func configureView()
    func addSubviews()
    func constrainSubviews()
}

extension ViewCodeProtocol {
    func setupViewCodeComponent() {
        configureView()
        addSubviews()
        constrainSubviews()
    }

    func configureView() {}

    func addSubviews() {}

    func constrainSubviews() {}
}
