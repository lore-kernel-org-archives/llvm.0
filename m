Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA072C9D
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 15:01:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FF7C611C0;
	Fri,  5 Nov 2021 15:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636124508;
	bh=s6mPqLxwYn7H6drDafvIhfUiqoTclGupNfaKSiP1Qgc=;
	h=From:To:Cc:Subject:Date:From;
	b=MfqdvP+W4thSJlfyMmd6hkxo5E7sT4reXR3uXRpH9OqY11u6Iqo9uVYXpWkapLeSS
	 6BpiQktufM2lzlyw9G+mFr/fi+oPO6cE2yb7Sfe3lHbkJ4dsuw9A0OYktQrpXSzNq8
	 NfsA4PeTs6bJcw+AdLz6WGWAQ8QA+BQEeVRbahD81CAmpK9ZeCANMkPjvEX4XOXX4/
	 j2ENF8LNWhYT0kYtJbVDyrv5wXGpasZR73RorM8sb60647kUcXDrENbWQAzpi3NGyV
	 3LBU952q6z4t0vbP02f/OvPmx8zMQ4UwHPftJXcERMYTGyuhwM2DY1zUFLVSuCQ2LV
	 nh/y+52u2g32A==
From: Nathan Chancellor <nathan@kernel.org>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2] usb: dwc2: hcd_queue: Fix use of floating point literal
Date: Fri,  5 Nov 2021 07:58:03 -0700
Message-Id: <20211105145802.2520658-1-nathan@kernel.org>
X-Mailer: git-send-email 2.34.0.rc0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

A new commit in LLVM causes an error on the use of 'long double' when
'-mno-x87' is used, which the kernel does through an alias,
'-mno-80387' (see the LLVM commit below for more details around why it
does this).

 drivers/usb/dwc2/hcd_queue.c:1744:25: error: expression requires  'long double' type support, but target 'x86_64-unknown-linux-gnu' does not support it
                         delay = ktime_set(0, DWC2_RETRY_WAIT_DELAY);
                                             ^
 drivers/usb/dwc2/hcd_queue.c:62:34: note: expanded from macro 'DWC2_RETRY_WAIT_DELAY'
 #define DWC2_RETRY_WAIT_DELAY (1 * 1E6L)
                                 ^
 1 error generated.

This happens due to the use of a 'long double' literal. The 'E6' part of
'1E6L' causes the literal to be a 'double' then the 'L' suffix promotes
it to 'long double'.

There is no visible reason for a floating point value in this driver, as
the value is only used as a parameter to a function that expects an
integer type. Use NSEC_PER_MSEC, which is the same integer value as
'1E6L', to avoid changing functionality but fix the error.

Fixes: 6ed30a7d8ec2 ("usb: dwc2: host: use hrtimer for NAK retries")
Link: https://github.com/ClangBuiltLinux/linux/issues/1497
Link: https://github.com/llvm/llvm-project/commit/a8083d42b1c346e21623a1d36d1f0cadd7801d83
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---

v1 -> v2: https://lore.kernel.org/r/20211104215923.719785-1-nathan@kernel.org/

* Use NSEC_PER_MSEC instead of USEC_PER_SEC, as the units of the second
  parameter of ktime_set is nanoseconds. Thanks to John Keeping for
  pointing this out.

* Pick up Nick's review tag.

 drivers/usb/dwc2/hcd_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 89a788326c56..24beff610cf2 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -59,7 +59,7 @@
 #define DWC2_UNRESERVE_DELAY (msecs_to_jiffies(5))
 
 /* If we get a NAK, wait this long before retrying */
-#define DWC2_RETRY_WAIT_DELAY (1 * 1E6L)
+#define DWC2_RETRY_WAIT_DELAY (1 * NSEC_PER_MSEC)
 
 /**
  * dwc2_periodic_channel_available() - Checks that a channel is available for a

base-commit: d4439a1189f93d0ac1eaf0197db8e6b3e197d5c7
-- 
2.34.0.rc0

