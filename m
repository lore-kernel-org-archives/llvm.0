Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143017C
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 03:23:09 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id 195so8222556iou.0
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 19:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jRsQTn4wCzaZWlo654y/O+Q/GT31fRr+BuSdOnqZR1Y=;
        b=fvR7piB7DZnzOqqEYJxB8wUul9orDCFdnSskryfHkY9iKX+zek1+kF14XqR/0huQds
         6O/QovSQXZ2x93e4bID4nSKW9FpMbJJ5F+aPY5raEkvF+A5NkPAC9R+SSjAIQo3pn/ut
         jwLfzh4XrvM1yX83aI8UbSyQgs/N4cLShG3coEukqtnI7O+SyUzVsAGjpiH4zdXPOkkh
         RA7nOZHsbtJy6DsN20093328KZlbMFqwKJHsr77SmxgW+A+k70tiogRN910AoaESmZ7J
         hzOfktD0beL3xtlyOq3eXoGiuK3eM9BzACI0QB8KX65+rce/0KmgwoJhjObToxGAywSX
         Ajzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jRsQTn4wCzaZWlo654y/O+Q/GT31fRr+BuSdOnqZR1Y=;
        b=N9Oyb6djlFD9cAumkS1Cs+GG6oLsKpC5Jfc8m33p1F1RMleoPz3RwA2kHbGmddlG59
         kEWN2TvaaarrALWyCzciakseowRGk8PB3BpucsUZ/yJjG6Ttcx5nANyqoUBtpJmzFDxd
         1FJIxCICa2+vabAhaAZOHL6VCLwQM5yhwL5toe9w8g3/0oDqkhiuLD4/E27y/zFOZ7jp
         woScG5Do/jd0zNqLb+7BP12Ix2WRB2yW5YaBDK3yPjvhcocV3t6WY76FryLZf0Gp+xsI
         uyT+mzVQxaFziIz7ghT7m7zjBLkr1keCmed7OwjP92Gv6rtrJ8zfN+bifQ7Bb2U8/Osw
         Yqtg==
X-Gm-Message-State: AOAM533GJJQj6j8PufB6h5Mj/vEGuIqK3m3X33cIMxlMeRnw79rQHaKr
	5snHUkswmNgbXIHi/phALYo=
X-Google-Smtp-Source: ABdhPJzBuxIH+6Sm/YdwRiul6bTlvL+N3IPEgoVoC6l7BDY9imdraQNZYs3AJB8ldE1OX/R3UBuclg==
X-Received: by 2002:a5d:9da2:0:b0:645:6c2f:bebf with SMTP id ay34-20020a5d9da2000000b006456c2fbebfmr4594026iob.91.1646364188123;
        Thu, 03 Mar 2022 19:23:08 -0800 (PST)
Received: from localhost.localdomain (118-208-215-36.tpgi.com.au. [118.208.215.36])
        by smtp.gmail.com with ESMTPSA id a13-20020a056e02180d00b002c25b51d5ecsm4114751ilv.55.2022.03.03.19.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 19:23:07 -0800 (PST)
From: Sam Zeter <samuelzeter@gmail.com>
To: mhiramat@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Samuel Zeter <samuelzeter@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/2] *** Fix reformat_objdump.awk ***
Date: Fri,  4 Mar 2022 14:16:09 +1100
Message-Id: <20220304031611.5763-1-samuelzeter@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <YdeGWyzvsXxntcAT@archlinux-ax161>
References: <YdeGWyzvsXxntcAT@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 -> v2
 - coding style commit message amendments.

Samuel Zeter (2):
  arch/x86/tools/objdump_reformat.awk: Ensure regex matches fwait
  arch/x86/tools/objdump_reformat.awk: Allow for spaces

 arch/x86/tools/objdump_reformat.awk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.35.1

