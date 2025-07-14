Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BB317A2EC;
	Mon, 14 Jul 2025 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752513364; cv=none; b=NzwwWPTb2qRtrhWXEo+D3Wf9kSQdPE1TVFbJy+7kCK7x6A3hFpKJOMQmQ1mOCoDazpNK4IFlAfi6uKQa7yPHK3bQOgkcT5ql1hQWaehqfDnrce8C7gNSR8dGul6RxbApyxoxUa+iXolMBp+SuJw+69g/rFbYJ5IcvkvhrfPkaeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752513364; c=relaxed/simple;
	bh=6m85wYmGPnnc4asSalRFdjp8FI3bHlAHsTWMgWqjY/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nU7ZcMnD8wd9GOaSlel5jF/7D9ScFDOkDK5zjPmqzKwtcrkdxFxjCisj093YE249UGHmWhJGKS4NPNUVZSYXJftPF3L5vOEZbFL7tCwYN6ReNDwkaFxXr90pbw0qBUj4OphT9tD1m3xWbJ3GQsfl9gychJuD08lvTydYa7LS0Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbGd1zSw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbGd1zSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CC1C4CEED;
	Mon, 14 Jul 2025 17:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752513364;
	bh=6m85wYmGPnnc4asSalRFdjp8FI3bHlAHsTWMgWqjY/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbGd1zSwBYhM0YYQBmf/nUf2yQEyJLu0TsprSrxxqZvb4k+ffnly04zsOYRFBM1vq
	 pu14lnXwdjXS5jCFa877iralVgtkv8ettACY4nCdz0bXQZoiIGsDubBv0CUbhObw/z
	 3EpERtSygsrSQNFqLD5F0f5n4ZeWPypubE5G1rdnE04PrEsNw3pNvuo78rRAGUPvu7
	 jaHyjoX+LEAm+bqKP4Zo5RabRz17IUYnUqXCDvb00pnuCEUaiToJmfjHi6Hm8t4VR/
	 xmd5E+YDnH/b406r1hEUyan+8C0bp5YNl8MGwNaoAbHESCDJSlgZq6eJlYmAm40b/q
	 EMoaptjhQ+0zg==
Date: Mon, 14 Jul 2025 10:15:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "lkp@intel.com" <lkp@intel.com>, Timothy Hayes <Timothy.Hayes@arm.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, nd <nd@arm.com>
Subject: Re: [linux-next:master 7731/9053]
 arch/arm64/kvm/vgic/vgic-mmio.c:1094:3: warning: variable 'len' is used
 uninitialized whenever 'if' condition is false
Message-ID: <20250714171559.GA1364710@ax162>
References: <202507130334.ddFcXn4N-lkp@intel.com>
 <06b16fee8f7a1d60e6723e5dafb12158d6797c7d.camel@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06b16fee8f7a1d60e6723e5dafb12158d6797c7d.camel@arm.com>

Hi Sascha,

On Mon, Jul 14, 2025 at 12:37:35PM +0000, Sascha Bischoff wrote:
> On Sun, 2025-07-13 at 03:29 +0800, kernel test robot wrote:
> > commit: c017e49ed1381001ba7a6521daae8f968b11cf09 [7731/9053] KVM: arm64: gic-v5: Support GICv3 compat
> > config: arm64-randconfig-004-20250713 (https://download.01.org/0day-ci/archive/20250713/202507130334.ddFcXn4N-lkp@intel.com/config)
> > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
...
> > arch/arm64/kvm/vgic/vgic-mmio.c:1094:3: warning: variable 'len' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> >     1094 |                 BUG_ON(1);
> >          |                 ^~~~~~~~~
> >    include/asm-generic/bug.h:71:36: note: expanded from macro 'BUG_ON'
> >       71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
> >          |                                    ^~~~~~~~~~~~~~~~~~~
> >    include/linux/compiler.h:47:23: note: expanded from macro 'unlikely'
> >       47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
...
> There is no actual uninitialized use of len occurring here. It is
> explicitly initialized in both the VGIC_V2 and VGIC_V3 cases. The only
> other path is the default case, which triggers BUG_ON(1).
> 
> For arm64, BUG() itself is defined as:
> 
> #define BUG() do {					\
> 	__BUG_FLAGS(0);					\
> 	unreachable();					\
> } while (0)
> 
> Since __BUG_FLAGS(0) is followed by unreachable(), the compiler should
> ideally recognize that code paths beyond this point are dead. 
> The fact that this warning is still being emitted suggests the compiler
> isn’t correctly propagating the unreachable() information in this
> context.
> 
> Given that, this seems like an issue on the compiler side, or possibly
> a case where BUG_ON() could be restructured to more explicitly convey
> control-flow termination to the compiler.

In a normal configuration, it is easy for the compiler to see that
BUG_ON(1) is the same thing as BUG() and take into account the
__builtin_unreachable() at the end to avoid warnings.

However, the key to what is going on here is in the second note: this
configuration has CONFIG_TRACE_BRANCH_PROFILING=y, which turns
unlikely() into

#define __branch_check__(x, expect, is_constant) ({			\
			long ______r;					\
			static struct ftrace_likely_data		\
				__aligned(4)				\
				__section("_ftrace_annotated_branch")	\
				______f = {				\
				.data.func = __func__,			\
				.data.file = __FILE__,			\
				.data.line = __LINE__,			\
			};						\
			______r = __builtin_expect(!!(x), expect);	\
			ftrace_likely_update(&______f, ______r,		\
					     expect, is_constant);	\
			______r;					\
		})

Clang's semantic analysis phase happens early in the front end, so it is
not able to value track ______r yet, meaning that it thinks BUG() is
only conditionally called, leaving len uninitialized in the other
imaginary branch.

I see two ways to fix this. The most obvious is just turn this BUG_ON(1)
into BUG() directly to avoid having an unlikely() in the first place.

diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index e416e433baff..a573b1f0c6cb 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -1091,7 +1091,7 @@ int vgic_register_dist_iodev(struct kvm *kvm, gpa_t dist_base_address,
 		len = vgic_v3_init_dist_iodev(io_device);
 		break;
 	default:
-		BUG_ON(1);
+		BUG();
 	}
 
 	io_device->base_addr = dist_base_address;
---

The other option would be to turn the unlikely() in the generic BUG_ON()
to unlikely_notrace(), so that the '1' condition can always be
constantly evaluated. I am not sure having branch checks on BUG_ON() is
super useful since these are conditions that are intentionally hard to
hit and you will know when they are :)

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index 2d9f61346dab..35f3e914b068 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -74,7 +74,7 @@ struct bug_entry {
 #endif
 
 #ifndef HAVE_ARCH_BUG_ON
-#define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
+#define BUG_ON(condition) do { if (unlikely_notrace(condition)) BUG(); } while (0)
 #endif
 
 /*
---

Both of these resolve the warning from the original configuration for
me.

Cheers,
Nathan
