Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895C47F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 08:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836D8C433D6;
	Mon,  1 Aug 2022 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1659344053;
	bh=tOIeTrLyglxdoXT5MgXxxllleWXSMFXhyMKoBiBK0NQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=ed+vhNYDlczBrFOdAnhReuKn/p0nI8jekcNpEZnwbWr5ru/F4dimoE8fuuxXamJAd
	 FIiOe2eJSzJeOHPGdixZB6STtacfoBxxW5xheJVOmgoqGvmqY9qZx9qinLIqn6C836
	 JD7RbmuAV5u9Iq0/XebsLek3TeLWrD8KI51pR0hY=
Subject: Patch "ion: Make user_ion_handle_put_nolock() a void function" has been added to the 4.9-stable tree
To: drosen@google.com,gregkh@linuxfoundation.org,lkp@intel.com,llvm@lists.linux.dev,nathan@kernel.org,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 01 Aug 2022 10:54:10 +0200
In-Reply-To: <20220727164617.980209-1-nathan@kernel.org>
Message-ID: <165934405044148@kroah.com>
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

    ion: Make user_ion_handle_put_nolock() a void function

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     ion-make-user_ion_handle_put_nolock-a-void-function.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Mon Aug  1 10:53:38 2022
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 27 Jul 2022 09:46:17 -0700
Subject: ion: Make user_ion_handle_put_nolock() a void function
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Daniel Rosenberg <drosen@google.com>, stable@vger.kernel.org, llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Message-ID: <20220727164617.980209-1-nathan@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

Clang warns:

  drivers/staging/android/ion/ion-ioctl.c:71:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
          if (--handle->user_ref_count == 0)
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/staging/android/ion/ion-ioctl.c:74:9: note: uninitialized use occurs here
          return ret;
                 ^~~
  drivers/staging/android/ion/ion-ioctl.c:71:2: note: remove the 'if' if its condition is always true
          if (--handle->user_ref_count == 0)
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/staging/android/ion/ion-ioctl.c:69:9: note: initialize the variable 'ret' to silence this warning
          int ret;
                 ^
                  = 0
  1 warning generated.

The return value of user_ion_handle_put_nolock() is not checked in its
one call site in user_ion_free_nolock() so just make
user_ion_handle_put_nolock() return void to remove the warning.

Fixes: a8200613c8c9 ("ion: Protect kref from userspace manipulation")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/android/ion/ion-ioctl.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

--- a/drivers/staging/android/ion/ion-ioctl.c
+++ b/drivers/staging/android/ion/ion-ioctl.c
@@ -64,14 +64,10 @@ static struct ion_handle *pass_to_user(s
 }
 
 /* Must hold the client lock */
-static int user_ion_handle_put_nolock(struct ion_handle *handle)
+static void user_ion_handle_put_nolock(struct ion_handle *handle)
 {
-	int ret;
-
 	if (--handle->user_ref_count == 0)
-		ret = ion_handle_put_nolock(handle);
-
-	return ret;
+		ion_handle_put_nolock(handle);
 }
 
 static void user_ion_free_nolock(struct ion_client *client,


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-4.9/arm-crypto-comment-out-gcc-warning-that-breaks-clang-builds.patch
queue-4.9/ion-make-user_ion_handle_put_nolock-a-void-function.patch
