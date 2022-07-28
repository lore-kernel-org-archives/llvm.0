Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0F27A
	for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 17:33:44 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id j195so4314615ybj.11
        for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=ZRdTLBRlf+wh5Zf8PIss2BXNbHPoeVm5zxJHyeakgCI=;
        b=Uc4yxnsiOLAW9QqnrHiNNibq/7hLEDc9ExaJEqUinhgRcN/CXkf2JkMOu249D19Wa2
         jjN0Dpb3bzUtb2hODRa8XJ+GqKh1ldLCyq/hkJiGsI9XvbcImgr6C7iFEJ2Ut0hv+yfG
         NkUd1UTLn7xyPf5FpUcUB2to2mbZKhE3tORAQGPu4sSA2WHH1KNKx2rvWNAR+1ixia75
         Q00YEYC9Ek7OjOr7JHZ7dMVpWTzSFuhhr3rsfb/RXHR30B4lM0yoIz1NRJAWzoZtvUD4
         p3i3ENAbUAvYTiKc7KYD2qZFFkm7Zy2E/2cSHsdMPu/MBur2cPemIPMEHT5TauBSw6W0
         kscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=ZRdTLBRlf+wh5Zf8PIss2BXNbHPoeVm5zxJHyeakgCI=;
        b=IoyBA+vBqszasszV18sOSMxmO+1DONS/X1ofoGnMDUaFaF5/bDa04nj2bYps8lNloZ
         /hUvNwOZPwuewu2m/y4YJ23935bf/8dzKey2Q6r5ytCGZfLtpT6hUZCwfFzgr0VIvb0R
         fMC9gPiIVYodV49is4LLBvN8K0uU0dgEDXJnByYiXrva5fwMN/v7FD5Cc9hpj8WC1GUm
         +g8eRqS6ft7QfcO1UJQAfcqiaqJG0iw0XHV+XDcXYx8d5UpY2+MENXKgIRS0U/CxWDyY
         MlqEUGeVINJp2iuBPKRbtHQgeHhrkh54yRN5FB2kztbSnJWf4x4g6yYDtV0X3u0h4Mw7
         an7A==
X-Gm-Message-State: AJIora+kFNhHm8Z/CT9lAfN73v1Md2GYbbw3Ixy27LxC44yQj0o//Cu+
	4sNJwpczj59vMwDY8xSPUo1lQ4MNCJu1HrmlTkntSHBZ7C+LKg==
X-Google-Smtp-Source: AGRyM1sEFaBh3uEaEg3MVsbKKapTmun8fVjnjxNV3NH4ZKMs9yrwMDzjmUOIpvDf7/VlObGCkOOiRqYMaMF8EhhdrEE=
X-Received: by 2002:a25:508b:0:b0:672:e8af:3bfe with SMTP id
 e133-20020a25508b000000b00672e8af3bfemr4893048ybb.106.1659029623783; Thu, 28
 Jul 2022 10:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 28 Jul 2022 18:33:07 +0100
Message-ID: <CADVatmPNCUXqKBoLCpwBA90ocZA6-u+=y1_jz=3C+KwEmN54AA@mail.gmail.com>
Subject: arm ixp4xx_defconfig build failure with linux-next and mainline
To: Nathan Chancellor <nathan@kernel.org>
Cc: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi All,

Not sure if its reported, builds of arm ixp4xx_defconfig has been
failing with clang with the error:

<instantiation>:1:10: error: invalid hexadecimal number
ldr r7, =0x
         ^
arch/arm/kernel/head.S:319:2: note: while in macro instantiation
 addruart r7, r3, r0
 ^
<instantiation>:2:12: error: invalid hexadecimal number
  ldr r3, =0x
           ^
arch/arm/kernel/head.S:319:2: note: while in macro instantiation
 addruart r7, r3, r0


I tried to find it in the issue tracker but could not find it.

-- 
Regards
Sudip
