Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999402C9D
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 15:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80F5C36AE0;
	Wed,  5 Jan 2022 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1641395089;
	bh=2zPNPVbrbY38TNEAgTggHeQ7eaFnb7fBF5StfI57J/A=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=ym6n7zLPhoGuHzPNp9ktiWD+ruGY6EWa4eWhc6AdqW3Xk19MpkujYv13GeOSc/B0y
	 dNd/JMSpM94RvnoDtdtpjzctFaG82jMUQOmbTAVAG7XV/SL3DzDHCfZuKVhwZKzzOZ
	 dsmCfjWlLq9fHx1ttalchKkyHp+zTVrxjfiCEC2g=
Subject: Patch "Input: touchscreen - Fix backport of a02dcde595f7cbd240ccd64de96034ad91cffc40" has been added to the 5.4-stable tree
To: anders.roxell@linaro.org,gregkh@linuxfoundation.org,llvm@lists.linux.dev,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 05 Jan 2022 16:04:46 +0100
In-Reply-To: <20220103192935.3438038-1-nathan@kernel.org>
Message-ID: <1641395086143124@kroah.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    Input: touchscreen - Fix backport of a02dcde595f7cbd240ccd64de96034ad91cffc40

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     input-touchscreen-fix-backport-of-a02dcde595f7cbd240ccd64de96034ad91cffc40.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Wed Jan  5 16:03:30 2022
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon,  3 Jan 2022 12:29:35 -0700
Subject: Input: touchscreen - Fix backport of a02dcde595f7cbd240ccd64de96034ad91cffc40
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org, llvm@lists.linux.dev, Anders Roxell <anders.roxell@linaro.org>, Nathan Chancellor <nathan@kernel.org>
Message-ID: <20220103192935.3438038-1-nathan@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

Upstream commit a02dcde595f7 ("Input: touchscreen - avoid bitwise vs
logical OR warning") was applied as commit f6e9e7be9b80 ("Input:
touchscreen - avoid bitwise vs logical OR warning") in linux-5.4.y but
it did not properly account for commit d9265e8a878a ("Input:
of_touchscreen - add support for touchscreen-min-x|y"), which means the
warning mentioned in the commit message is not fully fixed:

drivers/input/touchscreen/of_touchscreen.c:78:17: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
        data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/input/touchscreen/of_touchscreen.c:78:17: note: cast one or both operands to int to silence this warning
drivers/input/touchscreen/of_touchscreen.c:92:17: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
        data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/input/touchscreen/of_touchscreen.c:92:17: note: cast one or both operands to int to silence this warning
2 warnings generated.

It seems like the 4.19 backport was applied to the 5.4 tree, which did
not have any conflicts so no issue was noticed at that point.

Fix up the backport to bring it more in line with the upstream version
so that there is no warning.

Fixes: f6e9e7be9b80 ("Input: touchscreen - avoid bitwise vs logical OR warning")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/input/touchscreen/of_touchscreen.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/drivers/input/touchscreen/of_touchscreen.c
+++ b/drivers/input/touchscreen/of_touchscreen.c
@@ -77,8 +77,8 @@ void touchscreen_parse_properties(struct
 	axis = multitouch ? ABS_MT_POSITION_X : ABS_X;
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
 						input_abs_get_min(input, axis),
-						&minimum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-size-x",
+						&minimum);
+	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-x",
 						input_abs_get_max(input,
 								  axis) + 1,
 						&maximum);
@@ -91,8 +91,8 @@ void touchscreen_parse_properties(struct
 	axis = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
 						input_abs_get_min(input, axis),
-						&minimum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-size-y",
+						&minimum);
+	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-y",
 						input_abs_get_max(input,
 								  axis) + 1,
 						&maximum);


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-5.4/input-touchscreen-fix-backport-of-a02dcde595f7cbd240ccd64de96034ad91cffc40.patch
