Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67567B
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 18:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5565DC385A4;
	Tue, 26 Apr 2022 18:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650997470;
	bh=K2P4CR3cLpWGpkziBMUY1Z5EXMU45sivecbtZLcwVH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bT5eBfX6/DMuJP8o7yAwV5waIk+vYWAkP4UIl2nBOEzZEvA6ju/45BYtU8734OXgn
	 EOzwPigr7F//ZKzM9HU88Xoc3UhIZIF4n5EPu1bxTUelQqXy+tpIOn82O80MSCiKJx
	 UwQH32QSgUsGat4qkmo1D09oNOx71FohHodLWbpNU03WGbv3NMH+50aXqjkS8KCu8g
	 kLIjmTpq5vaRkI3YejscJ2Ncr1eaLMVxu/2xnLZTIjtdxMxa4acp3E0lvIdr7t1Hq8
	 GjTngDczGnF39cvCWFACFrf9zS7xhnAkLhE6aANZDslFoC+isxmFadpP+dJ0P/EY1O
	 iphGwzq4LaUYQ==
Date: Tue, 26 Apr 2022 11:24:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mauro Rossi <issor.oruam@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Chih-Wei Huang <cwhuang@android-x86.org>,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: Android 11 clang toochain: kernel 5.18 build error with 32 bit
 target
Message-ID: <Ymg43Ed/Sg8szdKq@dev-arch.thelio-3990X>
References: <CAEQFVGb2aXVu7eys5PM=xZ7gtzdap_QyRrzi3WzY83ka=heOwQ@mail.gmail.com>
 <CAK8P3a0Lwtm86wYH+0yFtr=Luc6g3OLu_+vzZaJqxDxNHFmQDQ@mail.gmail.com>
 <CAKwvOdmfHS8UwZhEL-tLMJSzCXQEZZZhEMpDXuJHtP5s9yePBw@mail.gmail.com>
 <CAEQFVGYpPaE3cCxUBaiT97GU1i4Nr6yJdv6mU1kiCxqkLSMfBQ@mail.gmail.com>
 <CAK8P3a2vHuRB1vkjVkKaNxr3Ptfv3UBS0scsShQPxY46_xh9kA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2vHuRB1vkjVkKaNxr3Ptfv3UBS0scsShQPxY46_xh9kA@mail.gmail.com>

On Tue, Apr 26, 2022 at 02:21:16PM +0200, Arnd Bergmann wrote:
> On Mon, Apr 25, 2022 at 9:13 PM Mauro Rossi <issor.oruam@gmail.com> wrote:
> > I have checked also with kernel-5.17 and the same build error is
> > happening also there, so it is not due to commit 34737e2698 ("uaccess: add generic
> > __{get,put}_kernel_nofault")
> 
> Ok, that's good to know, thanks for checking! I suspect the problem is
> using a slightly too-old prerelease build of clang, where the released
> clang-11 build had the asm-goto-with-output feature enabled.

Correct, the build failure can be reproduced with tip of tree LLVM if
CONFIG_CC_HAS_ASM_GOTO_OUTPUT is manually disabled, such as:

diff --git a/init/Kconfig b/init/Kconfig
index ddcbefe535e9..3121f1c96014 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -73,9 +73,9 @@ config CC_CAN_LINK_STATIC
 config CC_HAS_ASM_GOTO
 	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
 
-config CC_HAS_ASM_GOTO_OUTPUT
-	depends on CC_HAS_ASM_GOTO
-	def_bool $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
+#config CC_HAS_ASM_GOTO_OUTPUT
+#	depends on CC_HAS_ASM_GOTO
+#	def_bool $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
 
 config TOOLS_SUPPORT_RELR
 	def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(NM)" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)

But all supported released versions of clang will have this enabled so I
am not sure it is worth inserting a workaround for this particular
problem... More on that below.

> Maybe we should just increase the minimum version to clang-11.1 for
> the kernel to keep others from running into this issue.

I am not sure how available clang 11.1.0 is for various distributions,
but I am not fundamentally opposed to this, as it would resolve the
issue in this particular case.

It would be nice to have some way to detect prerelease vs. final
versions of LLVM, which would help us out in this scenario. We have
always tried to support prerelease versions of LLVM but only when it is
the current main version. In other words, if someone is using a
prereleased version of LLVM 14, we would tell them to either upgrade to
the current LLVM 14 version or move to the current prerelease version of
15, as LLVM intends for the main branch to be release worthy at any
point, so this is not unreasonable.

There is an upstream issue around this:

https://github.com/llvm/llvm-project/issues/53825

If we could look for "[0-9]git" in the output of 'clang --version', it
would make it possible to say "prerelease version detected, upgrade if
you experience any issues" or something along those lines.

Another idea would be adopting something along the lines of GCC's
versioning scheme: https://gcc.gnu.org/develop.html

If upstream LLVM were to do that, we would be able to turn more of the
release checks into x.1.0, rather than x.0.0.

Cheers,
Nathan
