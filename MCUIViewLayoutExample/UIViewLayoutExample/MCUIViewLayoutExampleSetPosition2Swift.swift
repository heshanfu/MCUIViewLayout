// Copyright (c) 2016, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

import Foundation

class MCUIViewLayoutExampleSetPosition2Swift: UIView
{
    private let margin: CGFloat = 10

    private let topLeftLabel = UILabel()
    private let topLabel = UILabel()
    private let topRightLabel = UILabel()
    private let leftLabel = UILabel()
    private let centeredLabel = UILabel()
    private let rightLabel = UILabel()
    private let bottomLeftLabel = UILabel()
    private let bottomLabel = UILabel()
    private let bottomRightLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .blue

        addLabel(topLeftLabel, title: "topLeft")
        addLabel(topLabel, title: "top")
        addLabel(topRightLabel, title: "topRight")

        addLabel(leftLabel, title: "left")
        addLabel(centeredLabel, title: "centered")
        addLabel(rightLabel, title: "right")

        addLabel(bottomLeftLabel, title: "bottomLeft")
        addLabel(bottomLabel, title: "bottom")
        addLabel(bottomRightLabel, title: "bottomRight")

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MCUIViewLayoutExampleSetPosition2Swift.close)))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        topLeftLabel.layout.topLeft.margins(margin).width(200)
        topLabel.layout.topHCenter.margins(margin).height(40)
        topRightLabel.layout.topRight.margins(margin).size(CGSize(width: 100, height: 40))

        leftLabel.layout.leftVCenter.margins(margin).sizeThatFitsWidth(100)
        centeredLabel.layout.center.margins(margin).sizeThatFitsHeight(80)
        rightLabel.layout.rightVCenter.margins(margin).sizeThatFits(CGSize(width: 40, height: 400))

        // Reference to other views
        topLabel.layout.topHCenter.margins(margin).widthMatch(topLeftLabel)
        topLabel.layout.topHCenter.margins(margin).heightMatch(topLeftLabel)
        topLabel.layout.topHCenter.margins(margin).matchSize(topLeftLabel)
        topLabel.layout.widthSpaceBetween(view: topLabel, andView: topLabel)
        topLabel.layout.heightSpaceBetween(view: topLabel, andView: topLabel)

        bottomLeftLabel.layout.bottomLeft.margins(margin).sizeThatFitsViewWidth(topLeftLabel)
        bottomLabel.layout.bottomHCenter.margins(margin).sizeThatFitsViewHeight(topLabel)
        bottomRightLabel.layout.bottomRight.margins(margin).sizeThatFitsViewSize(topRightLabel)

        

        // Resize only
        topLeftLabel.layout.height(200)
        topRightLabel.layout.heightMatch(topLeftLabel)
        topRightLabel.layout.widthMatch(topLeftLabel)
        topRightLabel.layout.matchSize(topLeftLabel)
        topRightLabel.layout.sizeThatFitsWidth(400)

        // Order is irrelevant
        topLeftLabel.layout.topLeft.margins(margin).width(200)
        // is similar to
        topLeftLabel.layout.width(200).margins(margin).topLeft


//        OR

        // Init positionning once
//        let positionning = ViewPositionning().margins(margin)
//
//        // Then change only the Position
//        topLeft.position(positionning.topLeft)
//        top.position(positionning.topHCenter)
//        topRight.position(positionning.topRight)
//
//        left.position(positionning.vCenterLeft)
//        centered.position(positionning.centers)
//        right.position(positionning.vCenterRight)
//
//        bottomLeft.position(positionning.bottomLeft)
//        bottom.position(positionning.bottomHCenter)
//        bottomRight.position(positionning.bottomRight)

        
        // ORIGINAL
//        topLeft.setPosition(.PositionTopLeft, margins: margins)
//        top.setPosition(.PositionTopHCenter, margins: margins)
//        topRight.setPosition(.PositionTopRight, margins: margins)
//        left.setPosition(.PositionVCenterLeft, margins: margins)
//
//        centered.setPosition(.PositionCenters, margins: margins)
//        right.setPosition(.PositionVCenterRight, margins: margins)
//        bottomLeft.setPosition(.PositionBottomLeft, margins: margins)
//
//        bottom.setPosition(.PositionBottomHCenter, margins: margins)
//        bottomRight.setPosition(.PositionBottomRight, margins: margins)
    }

    private func addLabel(_ label: UILabel, title: String) {
        label.text = title
        label.textAlignment = .center
        label.sizeToFit()
        label.backgroundColor = .white

        addSubview(label)
    }

    func close() {
        removeFromSuperview()
    }
}
