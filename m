Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D56E7C
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 19:39:11 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id h23so28763391ejj.12
        for <llvm@lists.linux.dev>; Wed, 06 Jul 2022 12:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QvNpqQgHD3r/0AjJmv+wvTR4iXNVCJ9z/UpjXBlgWmQ=;
        b=DEzsztcqPW0kLywp1noiVYdV+VY7fvimHLBmIWZL10XxWguXlFgbK93xdc6FH61qAk
         MTNTlmgP6oLWRE/SAtZVMCJbZLzBjohbBO1fZe+pLhHgDOhgPel/W7jLpE7eGlUAIafm
         aonzCshSDfAdeuMrixXL2JFLCFD11leXfcJzkl3lhg47IbL7rd/gEmqcIUfBiBq/LrqG
         WrSteBOGrH0uULDPwcdrpW5jCkx3z/sXtEfIV+U4rNQEH2mdTZNeJ7KIyWQYYtLmyGYx
         koZ43M6EhO4FQQWorEvkiHI9Ovg2CNw02yk3VNem+A7QWfGkS+MHv2zk+kYvqOB6sY8P
         drGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QvNpqQgHD3r/0AjJmv+wvTR4iXNVCJ9z/UpjXBlgWmQ=;
        b=QagR7u88clq1q5SE5NjqWVbieKvU56aUXStv7lnhNbzPjHjMe5+a/BJcm/4P87z+jF
         w/4MPKCgh9ZjHGUcTXmNYvbF851gMgBz0h5BU82BIlKeXzG5+x1yjceVJOdTxME/31x0
         Y5+MYn6TYyhAGugRuC0X0yUe30U3JB9SMXSvFPpabaTriAUb4aZyHgf6AC1J0tQNWxEB
         hZ0mw/TZ8lYuFeUIZASNTuxlPICfV4HblF2ic2JPNGifcRT46FfjmuZZTYenvYOgJO4I
         bsUfwboBbIbUuT+iruuZLf3xDB01T8Y+i8UX0ArLsHm1gECZBPiutsyj7CT/ePux43Rm
         MjJQ==
X-Gm-Message-State: AJIora9FI5ElOl+54+j6/Yx8H8KEixSuJpLUar3wyy4CYR+aKiH9n9mr
	4m/zXFIE/uUAkLpIZacRYxfaphhDCXRAdwqdqYG2C4yA
X-Google-Smtp-Source: AGRyM1sY2dkH+4NquXF/iFqad9ypuXqnJTRH3pW0ret1OzLwIO772X0VJ/ab61ys9Bvl7IjRffOqT6Jif1Ef88um+do=
X-Received: by 2002:a17:906:dc93:b0:726:a75b:f60f with SMTP id
 cs19-20020a170906dc9300b00726a75bf60fmr40439958ejc.564.1657136349517; Wed, 06
 Jul 2022 12:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220630191322.909650-1-Rodrigo.Siqueira@amd.com>
 <20220630191322.909650-3-Rodrigo.Siqueira@amd.com> <YsXNPayfiUGS67i0@dev-arch.thelio-3990X>
In-Reply-To: <YsXNPayfiUGS67i0@dev-arch.thelio-3990X>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Jul 2022 15:38:57 -0400
Message-ID: <CADnq5_OO0m2jP_2EpOfmULM+s-WeWt3ND_Xt+yAOku669rf6pA@mail.gmail.com>
Subject: Re: [PATCH 02/40] drm/amd/display: Add SubVP required code
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Stylon Wang <stylon.wang@amd.com>, 
	Alan Liu <HaoPing.Liu@amd.com>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>, 
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, llvm@lists.linux.dev, 
	Roman Li <roman.li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Solomon Chiu <solomon.chiu@amd.com>, Jerry Zuo <jerry.zuo@amd.com>, 
	Aurabindo Pillai <Aurabindo.Pillai@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>, 
	"Kotarac, Pavle" <pavle.kotarac@amd.com>, Wayne Lin <wayne.lin@amd.com>, Jun Lei <Jun.Lei@amd.com>, 
	"Wentland, Harry" <Harry.Wentland@amd.com>, "Gutierrez, Agustin" <agustin.gutierrez@amd.com>, 
	"Mahfooz, Hamza" <hamza.mahfooz@amd.com>
Content-Type: multipart/mixed; boundary="0000000000007555c905e3281f36"

--0000000000007555c905e3281f36
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 6, 2022 at 1:58 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Jun 30, 2022 at 03:12:44PM -0400, Rodrigo Siqueira wrote:
> > From: Alvin Lee <Alvin.Lee2@amd.com>
> >
> > This commit enables the SubVP feature. To achieve that, we need to:
> >
> > - Don't force p-state disallow on SubVP (can't block dummy p-state)
> > - Send calculated watermark to DMCUB for SubVP
> > - Adjust CAB mode message to PMFW
> > - Add a proper locking sequence for SubVP
> > - Various fixes to SubVP static analysis and determining SubVP config
> > - Currently SubVP not supported with pipe split so merge all pipes
> >   before setting up SubVp
> >
> > Reviewed-by: Jun Lei <Jun.Lei@amd.com>
> > Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Acked-by: Alan Liu <HaoPing.Liu@amd.com>
> > Signed-off-by: Alvin Lee <Alvin.Lee2@amd.com>
>
> This patch is now in linux-next as commit 85f4bc0c333c
> ("drm/amd/display: Add SubVP required code"), where it causes build
> failures when building for arm64 with both Clang and GCC (see bisect log
> below).
>
> Clang shows errors during modpost:
>
> ERROR: modpost: "__floatunsidf" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__divdf3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "fma" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__adddf3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__fixdfsi" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__muldf3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__floatsidf" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "__fixunsdfsi" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>

I think the attached patch may fix this.

Alex


> GCC shows errors along the lines of:
>
> In function 'populate_subvp_cmd_pipe_info',
>     inlined from 'dc_dmub_setup_subvp_dmub_command' at /home/nathan/cbl/src/linux-next/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:675:5:
> /home/nathan/cbl/src/linux-next/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:91: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
>   603 |                         (((double)dc->caps.subvp_prefetch_end_to_mall_start_us / 1000000) *
>       |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
>   604 |                         (phantom_timing->pix_clk_100hz * 100) + phantom_timing->h_total - 1) /
>       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /home/nathan/cbl/src/linux-next/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:604:63: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
>   603 |                         (((double)dc->caps.subvp_prefetch_end_to_mall_start_us / 1000000) *
>       |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   604 |                         (phantom_timing->pix_clk_100hz * 100) + phantom_timing->h_total - 1) /
>       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
> /home/nathan/cbl/src/linux-next/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:602:72: error: '-mgeneral-regs-only' is incompatible with the use of floating-point types
>   602 |         pipe_data->pipe_config.subvp_data.prefetch_to_mall_start_lines =
>       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
>   603 |                         (((double)dc->caps.subvp_prefetch_end_to_mall_start_us / 1000000) *
>       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   604 |                         (phantom_timing->pix_clk_100hz * 100) + phantom_timing->h_total - 1) /
>       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   605 |                         (double)phantom_timing->h_total;
>       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> I initially reproduced this with Fedora's configuration [1] but it
> appears that allmodconfig should show it as well. Our CI also shows
> problems for ARCH=riscv allmodconfig [2].
>
> I am happy to test patches as necessary.
>
> [1]: https://src.fedoraproject.org/rpms/kernel/raw/rawhide/f/kernel-aarch64-fedora.config
> [2]: https://builds.tuxbuild.com/2BZS5HPSuDdoMFw6mxjG2ZmT441/build.log
>
> Cheers,
> Nathan
>
> # bad: [088b9c375534d905a4d337c78db3b3bfbb52c4a0] Add linux-next specific files for 20220706
> # good: [e35e5b6f695d241ffb1d223207da58a1fbcdff4b] Merge tag 'xsa-5.19-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip
> git bisect start '088b9c375534d905a4d337c78db3b3bfbb52c4a0' 'e35e5b6f695d241ffb1d223207da58a1fbcdff4b'
> # good: [1a4255ede07a967e57115b54da5bd4b571d22a8c] Merge branch 'for-linux-next' of git://anongit.freedesktop.org/drm/drm-misc
> git bisect good 1a4255ede07a967e57115b54da5bd4b571d22a8c
> # bad: [756b44529e2ab179e4dd6f6358b5c351e1bbe5d3] Merge branch 'rcu/next' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
> git bisect bad 756b44529e2ab179e4dd6f6358b5c351e1bbe5d3
> # bad: [f26873a2fc786251765db3e0ced8e1424b862059] next-20220705/sound-asoc
> git bisect bad f26873a2fc786251765db3e0ced8e1424b862059
> # good: [fc34ece41f7183d522d15dc4189d8df6e8e23737] ASoC: Refactor non_legacy_dai_naming flag
> git bisect good fc34ece41f7183d522d15dc4189d8df6e8e23737
> # good: [3d313f09f31490cec9d5251b59adeb6542c944cc] drm/fourcc: fix integer type usage in uapi header
> git bisect good 3d313f09f31490cec9d5251b59adeb6542c944cc
> # bad: [a41afb357f09cde0714db9d590458c7bb6d90ca2] Merge branch 'for-linux-next' of git://anongit.freedesktop.org/drm-intel
> git bisect bad a41afb357f09cde0714db9d590458c7bb6d90ca2
> # bad: [88ef4c5bb36bf60b317b74d8652c7766c9272a7e] drm/amd/display: Apply ODM 2:1 policy for single display configuration
> git bisect bad 88ef4c5bb36bf60b317b74d8652c7766c9272a7e
> # good: [ff15cea338d2c78e0086d55c8a9dd637a5dd3ccc] drm/amd/display: expose additional modifier for DCN32/321
> git bisect good ff15cea338d2c78e0086d55c8a9dd637a5dd3ccc
> # good: [414e9f520e897818302a6b1729aa2dad8cc928ca] drm/amdkfd: Asynchronously free smi_client
> git bisect good 414e9f520e897818302a6b1729aa2dad8cc928ca
> # good: [4bdb9d6501763e83bacbf26846754c567773a1fb] drm/amdkfd: simplify vm_validate_pt_pd_bos
> git bisect good 4bdb9d6501763e83bacbf26846754c567773a1fb
> # good: [e72f03f4bdc4f3a251343cf343bce28c28cbac2a] drm/amd/display: Add missing registers for ACP
> git bisect good e72f03f4bdc4f3a251343cf343bce28c28cbac2a
> # bad: [90f33674a0756a6f0907b8f6350cec3f7be4032c] drm/amd/display: Prepare for new interfaces
> git bisect bad 90f33674a0756a6f0907b8f6350cec3f7be4032c
> # bad: [85f4bc0c333ceed24cbc9f69a2a77fab1ae3d4d1] drm/amd/display: Add SubVP required code
> git bisect bad 85f4bc0c333ceed24cbc9f69a2a77fab1ae3d4d1
> # first bad commit: [85f4bc0c333ceed24cbc9f69a2a77fab1ae3d4d1] drm/amd/display: Add SubVP required code

--0000000000007555c905e3281f36
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amd-display-fix-non-x86-PPC64-compilation.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amd-display-fix-non-x86-PPC64-compilation.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l5a06kgo0>
X-Attachment-Id: f_l5a06kgo0

RnJvbSA3ODczMGJlMTUyMjY3Nzc1MmFiMjZmNTdkNmY4YzY4Yjk2ZDM5NjZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFdlZCwgNiBKdWwgMjAyMiAxNTozMzowMSAtMDQwMApTdWJqZWN0OiBbUEFUQ0hd
IGRybS9hbWQvZGlzcGxheTogZml4IG5vbi14ODYvUFBDNjQgY29tcGlsYXRpb24KCk5lZWQgdG8g
cHJvdGVjdCBGUCBETUNVQiBjb2RlIHdpdGggQ09ORklHX0RSTV9BTURfRENfRENOLgpGaXhlcyBi
dWlsZCBmYWlsdXJlcyBsaWtlIHRoZSBmb2xsb3dpbmcgb24gYXJtNjQ6CkVSUk9SOiBtb2Rwb3N0
OiAiX19mbG9hdHVuc2lkZiIgW2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5rb10g
dW5kZWZpbmVkIQpFUlJPUjogbW9kcG9zdDogIl9fZGl2ZGYzIiBbZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1LmtvXSB1bmRlZmluZWQhCkVSUk9SOiBtb2Rwb3N0OiAiZm1hIiBbZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmtvXSB1bmRlZmluZWQhCkVSUk9SOiBtb2Rw
b3N0OiAiX19hZGRkZjMiIFtkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua29dIHVu
ZGVmaW5lZCEKRVJST1I6IG1vZHBvc3Q6ICJfX2ZpeGRmc2kiIFtkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHUua29dIHVuZGVmaW5lZCEKRVJST1I6IG1vZHBvc3Q6ICJfX211bGRmMyIg
W2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5rb10gdW5kZWZpbmVkIQpFUlJPUjog
bW9kcG9zdDogIl9fZmxvYXRzaWRmIiBbZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
LmtvXSB1bmRlZmluZWQhCkVSUk9SOiBtb2Rwb3N0OiAiX19maXh1bnNkZnNpIiBbZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmtvXSB1bmRlZmluZWQhCgpGaXhlczogODVmNGJjMGMz
MzNjICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgU3ViVlAgcmVxdWlyZWQgY29kZSIpClJlcG9ydGVk
LWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfZG11Yl9zcnYuYyAgfCAyICsrCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMzIvTWFrZWZpbGUgfCAxIC0KIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2RtdWJfc3J2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNfZG11Yl9zcnYuYwppbmRleCA2YTI1ZDY0ZGQxNWMuLjZiNDQ2YWU5ZTkxZiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2RtdWJfc3J2LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2RtdWJfc3J2LmMKQEAgLTM3
MCw2ICszNzAsNyBAQCB2b2lkIGRjX2RtdWJfc3J2X3F1ZXJ5X2NhcHNfY21kKHN0cnVjdCBkbXVi
X3NydiAqZG11YikKIAl9CiB9CiAKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EQ04KIC8qKgog
ICogKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKICAqIHBvcHVsYXRlX3N1
YnZwX2NtZF9kcnJfaW5mbzogSGVscGVyIHRvIHBvcHVsYXRlIERSUiBwaXBlIGluZm8gZm9yIHRo
ZSBETUNVQiBzdWJ2cCBjb21tYW5kCkBAIC02OTgsNiArNjk5LDcgQEAgdm9pZCBkY19kbXViX3Nl
dHVwX3N1YnZwX2RtdWJfY29tbWFuZChzdHJ1Y3QgZGMgKmRjLAogCWRjX2RtdWJfc3J2X2NtZF9l
eGVjdXRlKGRjLT5jdHgtPmRtdWJfc3J2KTsKIAlkY19kbXViX3Nydl93YWl0X2lkbGUoZGMtPmN0
eC0+ZG11Yl9zcnYpOwogfQorI2VuZGlmCiAKIGJvb2wgZGNfZG11Yl9zcnZfZ2V0X2RpYWdub3N0
aWNfZGF0YShzdHJ1Y3QgZGNfZG11Yl9zcnYgKmRjX2RtdWJfc3J2LCBzdHJ1Y3QgZG11Yl9kaWFn
bm9zdGljX2RhdGEgKmRpYWdfZGF0YSkKIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24zMi9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24zMi9NYWtlZmlsZQppbmRleCBmZTI5NzI1YjRjMDYuLjkzMmQ4NWZhNDI2MiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjMyL01ha2VmaWxlCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24zMi9NYWtlZmlsZQpAQCAtMjcs
NyArMjcsNiBAQCBpZmRlZiBDT05GSUdfQ0NfSVNfR0NDCiBpZmVxICgkKGNhbGwgY2MtaWZ2ZXJz
aW9uLCAtbHQsIDA3MDEsIHkpLCB5KQogSVNfT0xEX0dDQyA9IDEKIGVuZGlmCi1kY24zMl9jY2Zs
YWdzICs9IC1taGFyZC1mbG9hdAogZW5kaWYKIAogaWZkZWYgQ09ORklHX1g4NgotLSAKMi4zNS4z
Cgo=
--0000000000007555c905e3281f36--
