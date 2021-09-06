Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B03972
	for <llvm@lists.linux.dev>; Mon,  6 Sep 2021 19:55:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF7F96069E;
	Mon,  6 Sep 2021 19:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630958134;
	bh=QWFbS1sfr3FoD+pYhbPOA0FqRyC2Q9zP4D/4q2+mywE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ClWXiZ4huCeUmP9ETHkkW6nEnHkwbfkJRLswivWChrjyqbpoIoeY7p+3K9Zx8n5d4
	 mqOuBcsH49o6iyFmIqUI0bHzk6ENLbOTFvLe8spaXC0ZAGbvNAsapV/bZiHajd7a+n
	 5da6i7J94nOvKuzrXdNEUMssaZCbT+fBjRrNUPaGwJAW1oIusLCS7jr9zelUlL9G5U
	 B9YONSn5W+L202IHgibLKN0O4zwplkvRYkbhD79C/gQUjGSdT7miNCWYg1dlLW77Qt
	 T+8d8VJHxwmYShiAZfYRigAdAUBIfnWcxjeGFuGbrK6eJUSmTWH2wgDtUCTq0hyg2P
	 DzeMq86o9X5Lg==
Date: Mon, 6 Sep 2021 12:55:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: CKI Project <cki-project@redhat.com>
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 kernel 5.14.0 (mainline.kernel.org-clang, 1dbe7e38)
Message-ID: <YTZyMx91zV9kfDkQ@Ryzen-9-3900X.localdomain>
References: <cki.1C5DC3250F.MVNGS7F9XQ@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cki.1C5DC3250F.MVNGS7F9XQ@redhat.com>

On Mon, Sep 06, 2021 at 05:55:12PM -0000, CKI Project wrote:
> 
> Hello,
> 
> We ran automated tests on a recent commit from this kernel tree:
> 
>        Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>             Commit: 1dbe7e386f50 - Merge tag 'block-5.15-2021-09-05' of git://git.kernel.dk/linux-block
> 
> The results of these automated tests are provided below.
> 
>     Overall result: FAILED (see details below)
>              Merge: OK
>            Compile: FAILED
>  Selftests compile: OK
> 
> All kernel binaries, config files, and logs are available for download here:
> 
>   https://arr-cki-prod-datawarehouse-public.s3.amazonaws.com/index.html?prefix=datawarehouse-public/2021/09/06/366042792
> 
> We attempted to compile the kernel for multiple architectures, but the compile
> failed on one or more architectures:
> 
>            aarch64: FAILED (see build-aarch64.log.xz attachment)
>            ppc64le: FAILED (see build-ppc64le.log.xz attachment)
>              s390x: FAILED (see build-s390x.log.xz attachment)
>             x86_64: FAILED (see build-x86_64.log.xz attachment)
> 
> We hope that these logs can help you find the problem quickly. For the full
> detail on our testing procedures, please scroll to the bottom of this message.
> 
> Please reply to this email if you have any questions about the tests that we
> ran or if you have any suggestions on how to make future tests more effective.
> 
>         ,-.   ,-.
>        ( C ) ( K )  Continuous
>         `-',-.`-'   Kernel
>           ( I )     Integration
>            `-'
> ______________________________________________________________________________

aarch64:

00:00:19 kernel/sched/core.c:7934:1: error: stack frame size (1088) exceeds limit (1024) in function '__sched_setaffinity' [-Werror,-Wframe-larger-than]
00:00:19 __sched_setaffinity(struct task_struct *p, const struct cpumask *mask)
00:00:19 ^
00:00:19 1 error generated.

This appears to happen because cpumask_var_t variables in this config
are allocated on the stack (CONFIG_CPUMASK_OFFSTACK is not selected for
arm64) and this config sets CONFIG_NR_CPUS=4096, meaning struct cpumask
is 512 bytes large:

$ pahole -C cpumask_var_t kernel/sched/core.o
typedef struct cpumask             cpumask_var_t[1];

$ pahole -C cpumask kernel/sched/core.o
struct cpumask {
        long unsigned int          bits[64];             /*     0   512 */

        /* size: 512, cachelines: 8, members: 1 */
};

There is a little extra inlining that happens, as can be seen with
Nick's tool (https://github.com/ClangBuiltLinux/frame-larger-than):

$ python3 $CBL_GIT/frame-larger-than/frame_larger_than.py kernel/sched/core.o __sched_setaffinity
__sched_setaffinity:
        0       cpumask_var_t                   cpus_allowed
        0       cpumask_var_t                   new_mask
        4       int                             retval
cpumask_and:
bitmap_and:
cpumask_subset:
bitmap_subset:
cpumask_copy:
bitmap_copy:
        4       unsigned int                    len
        4       unsigned int                    len
__set_cpus_allowed_ptr:
        16      struct rq_flags                 rf
        8       struct rq*                      rq
        16      struct rq_flags                 rf
        8       struct rq*                      rq

GCC has the same issue:

kernel/sched/core.c: In function '__sched_setaffinity':
kernel/sched/core.c:7973:1: error: the frame size of 1040 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
 7973 | }
      | ^
cc1: all warnings being treated as errors

I am guessing there is a little less inling happening with GCC,
resulting in it being over the limit by less but the core of the issue
is still the same (two stack allocated 512 byte structures will be over
1024 with one other variable OR changed inlining decisions).

For what it's worth, CONFIG_FRAME_WARN defaults to 2048 for 64-bit so
this is somewhat self inflicted (none of these would be visible with
that value)...

$ sed -n '345,355p' lib/Kconfig.debug
config FRAME_WARN
        int "Warn for stack frames larger than"
        range 0 8192
        default 2048 if GCC_PLUGIN_LATENT_ENTROPY
        default 1536 if (!64BIT && PARISC)
        default 1024 if (!64BIT && !PARISC)
        default 2048 if 64BIT
        help
          Tell gcc to warn at build time for stack frames larger than this.
          Setting this too low will cause a lot of warnings.
          Setting it to 0 disables the warning.

00:00:44 arch/arm64/crypto/aes-neonbs-glue.c:270:12: error: stack frame size (1040) exceeds limit (1024) in function 'aesbs_xts_setkey' [-Werror,-Wframe-larger-than]
00:00:44 static int aesbs_xts_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
00:00:44            ^
00:00:44 1 error generated.

I think this is clang inling certain calls?

$ python3 $CBL_GIT/frame-larger-than/frame_larger_than.py arch/arm64/crypto/aes-neonbs-glue.o aesbs_xts_setkey
aesbs_xts_setkey:
        484     struct crypto_aes_ctx           rk
        8       struct aesbs_xts_ctx*           ctx
        4       int                             err
xts_verify_key:
crypto_memneq:
aesbs_setkey:
        484     struct crypto_aes_ctx           rk
        8       struct aesbs_ctx*               ctx
        4       int                             err
        484     struct crypto_aes_ctx           rk
        8       struct aesbs_ctx*               ctx
        4       int                             err

compared to GCC 11.2.0:

$ python3 $CBL_GIT/frame-larger-than/frame_larger_than.py arch/arm64/crypto/aes-neonbs-glue.o aesbs_xts_setkey
aesbs_xts_setkey:
        8       struct aesbs_xts_ctx*           ctx
        484     struct crypto_aes_ctx           rk
        4       int                             err

00:02:12 drivers/char/ipmi/ipmi_msghandler.c:4850:13: error: stack frame size (1072) exceeds limit (1024) in function 'ipmi_panic_request_and_wait' [-Werror,-Wframe-larger-than]
00:02:12 static void ipmi_panic_request_and_wait(struct ipmi_smi *intf,
00:02:12             ^
00:02:12 1 error generated.

clang-14:

$ python3 $CBL_GIT/frame-larger-than/frame_larger_than.py drivers/char/ipmi/ipmi_msghandler.o ipmi_panic_request_and_wait
ipmi_panic_request_and_wait:
        592     struct ipmi_smi_msg             smi_msg
        384     struct ipmi_recv_msg            recv_msg
        4       int                             rv
atomic_add:
arch_atomic_add:
system_uses_lse_atomics:
        1       bool                            branch
        1       bool                            branch
arch_static_branch_jump:
arch_static_branch_jump:
__lse_atomic_add:
__ll_sc_atomic_add:
        8       long unsigned int               tmp
        4       int                             result
atomic_sub:
arch_atomic_sub:
system_uses_lse_atomics:
        1       bool                            branch
        1       bool                            branch
arch_static_branch_jump:
arch_static_branch_jump:
__lse_atomic_sub:
__ll_sc_atomic_sub:
        8       long unsigned int               tmp
        4       int                             result
atomic_read:
ipmi_poll:

GCC 11.2.0:

$ python3 $CBL_GIT/frame-larger-than/frame_larger_than.py drivers/char/ipmi/ipmi_msghandler.o ipmi_panic_request_and_wait
ipmi_panic_request_and_wait:
        592     struct ipmi_smi_msg             smi_msg
        384     struct ipmi_recv_msg            recv_msg
        4       int                             rv
atomic_add:
arch_atomic_add:
system_uses_lse_atomics:
        1       bool                            branch
        1       bool                            branch
        1       bool                            branch
arch_static_branch_jump:
        1       bool                            branch
arch_static_branch_jump:
__lse_atomic_add:
__ll_sc_atomic_add:
        8       long unsigned int               tmp
        4       int                             result
        8       long unsigned int               tmp
        4       int                             result
atomic_read:
ipmi_poll:
atomic_sub:
arch_atomic_sub:
system_uses_lse_atomics:
        1       bool                            branch
        1       bool                            branch
        1       bool                            branch
arch_static_branch_jump:
        1       bool                            branch
arch_static_branch_jump:
__lse_atomic_sub:
__ll_sc_atomic_sub:
        8       long unsigned int               tmp
        4       int                             result
        8       long unsigned int               tmp
        4       int                             result

Not really sure why clang warns here while GCC doesn't... unless there
is a bug in the tool.

00:03:54 fs/jffs2/xattr.c:775:6: error: stack frame size (1216) exceeds limit (1024) in function 'jffs2_build_xattr_subsystem' [-Werror,-Wframe-larger-than]
00:03:54 void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c)
00:03:54      ^
00:03:54 1 error generated.

GCC 11.2.0 shows the same warning, albeit with less usage like before:

fs/jffs2/xattr.c: In function 'jffs2_build_xattr_subsystem':
fs/jffs2/xattr.c:887:1: warning: the frame size of 1104 bytes is larger than 1024 bytes [-Wframe-larger-than=]
  887 | }
      | ^

ppc64le and s390x are being worked on:

https://lore.kernel.org/r/20210906114804.GE143157@black/
https://gitlab.com/cki-project/pipeline-definition/-/merge_requests/1382

x86_64:

00:21:24 drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: error: variable 'err' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
00:21:24         else if (mlx5_esw_bridge_dev_same_hw(rep, esw))
00:21:24                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
00:21:24 drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:164:9: note: uninitialized use occurs here
00:21:24         return err;
00:21:24                ^~~
00:21:24 drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:7: note: remove the 'if' if its condition is always true
00:21:24         else if (mlx5_esw_bridge_dev_same_hw(rep, esw))
00:21:24              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
00:21:24 drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: initialize the variable 'err' to silence this warning
00:21:24         int err;
00:21:24                ^
00:21:24                 = 0
00:21:24 drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: error: variable 'err' is used uninitialized whenever switch case is taken [-Werror,-Wsometimes-uninitialized]
00:21:24         case SWITCHDEV_ATTR_ID_PORT_BRIDGE_FLAGS:
00:21:24              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
00:21:24 drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:276:9: note: uninitialized use occurs here
00:21:24         return err;
00:21:24                ^~~
00:21:24 drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: error: variable 'err' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
00:21:24                 if (attr->u.brport_flags.mask & ~(BR_LEARNING | BR_FLOOD | BR_MCAST_FLOOD)) {
00:21:24                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
00:21:24 drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:276:9: note: uninitialized use occurs here
00:21:24         return err;
00:21:24                ^~~
00:21:24 drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:3: note: remove the 'if' if its condition is always true
00:21:24                 if (attr->u.brport_flags.mask & ~(BR_LEARNING | BR_FLOOD | BR_MCAST_FLOOD)) {
00:21:24                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
00:21:24 drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: initialize the variable 'err' to silence this warning
00:21:24         int err;
00:21:24                ^
00:21:24                 = 0
00:21:24 3 errors generated.

Another report and pending patch:

https://lore.kernel.org/r/CA+G9fYsV7sTfaefGj3bpkvVdRQUeiWCVRiu6ovjtM=qri-HJ8g@mail.gmail.com/
https://lore.kernel.org/r/20210902190554.211497-4-saeed@kernel.org/

Cheers,
Nathan
