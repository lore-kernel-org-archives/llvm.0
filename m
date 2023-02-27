Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AD129A9
	for <llvm@lists.linux.dev>; Mon, 27 Feb 2023 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677501135; x=1709037135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RO6aTFXermoMWjG0Tt8TtnTKM9NV8n7SoUu00FD0WU8=;
  b=lxT02uTra9Xr9qTXW7nhMYavkTOsyizygVb3cYhY7RQ04l5Ar2m4u0Q7
   rp9chwGAVXeC6ZglNIQraQ94+6wtYSI3zqwHFbdbhCvmypFPlPxMCTcKm
   gUWvHg4YmFe9PFcjEp7E/oea8hqPquuwKUIpc4fD9UU96zJ49lqtfszSp
   M0wpLkGO31/Mmz6c70NqSl4+yNdM1ga4PT7ER6CesKPzfyXHjgM2uNAgN
   ppak1HOsBt+vZ7UpO7rYTbgLaHQWOBfaa/EATxviJCTF/A2tEHf4mROxl
   469nSyid6I4RMY1y7bwcWLXZqoUUz9jbvNv+5qz4aPezPUe/tRDXa3xgz
   w==;
X-IronPort-AV: E=Sophos;i="5.97,332,1669100400"; 
   d="asc'?scan'208";a="202701616"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Feb 2023 05:31:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 05:31:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 27 Feb 2023 05:31:43 -0700
Date: Mon, 27 Feb 2023 12:31:16 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Ard Biesheuvel
	<ardb@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, <nathan@kernel.org>, <llvm@lists.linux.dev>,
	<ndesaulniers@google.com>
Subject: Re: [PATCH v7 1/1] riscv: Allow to downgrade paging mode from the
 command line
Message-ID: <Y/yilORflGv3vXjX@wendy>
References: <20230224100218.1824569-1-alexghiti@rivosinc.com>
 <20230224100218.1824569-2-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8ORzwRGnfaATysc6"
Content-Disposition: inline
In-Reply-To: <20230224100218.1824569-2-alexghiti@rivosinc.com>

--8ORzwRGnfaATysc6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex, clang/llvm folk,

On Fri, Feb 24, 2023 at 11:02:18AM +0100, Alexandre Ghiti wrote:
> Add 2 early command line parameters that allow to downgrade satp mode
> (using the same naming as x86):
> - "no5lvl": use a 4-level page table (down from sv57 to sv48)
> - "no4lvl": use a 3-level page table (down from sv57/sv48 to sv39)
>=20
> Note that going through the device tree to get the kernel command line
> works with ACPI too since the efi stub creates a device tree anyway with
> the command line.
>=20
> In KASAN kernels, we can't use the libfdt that early in the boot process
> since we are not ready to execute instrumented functions. So instead of
> using the "generic" libfdt, we compile our own versions of those functions
> that are not instrumented and that are prefixed so that they do not
> conflict with the generic ones. We also need the non-instrumented versions
> of the string functions and the prefixed versions of memcpy/memmove.
>=20
> This is largely inspired by commit aacd149b6238 ("arm64: head: avoid
> relocating the kernel twice for KASLR") from which I removed compilation
> flags that were not relevant to RISC-V at the moment (LTO, SCS, pie).
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Tested-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  5 +-
>  arch/riscv/kernel/Makefile                    |  2 +
>  arch/riscv/kernel/pi/Makefile                 | 37 +++++++++++
>  arch/riscv/kernel/pi/cmdline_early.c          | 62 +++++++++++++++++++

+      4 ld.lld: warning: vmlinux.a(arch/riscv/kernel/pi/string.pi.o):(.ini=
t.sdata) is being placed in '.init.sdata'

I'm getting 4 new linker warnings with LLVM=3D1 clang-15 allmodconfig
builds - but I don't really understand this issue.
Is this spurious, and a just consequence of...

> diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
> new file mode 100644
> index 000000000000..4002ed94b6d3
> --- /dev/null
> +++ b/arch/riscv/kernel/pi/Makefile
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# This file was copied from arm64/kernel/pi/Makefile.
> +
> +KBUILD_CFLAGS	:=3D $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> +		   -Os -DDISABLE_BRANCH_PROFILING $(DISABLE_STACKLEAK_PLUGIN) \
> +		   $(call cc-option,-mbranch-protection=3Dnone) \
> +		   -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
> +		   -D__DISABLE_EXPORTS -ffreestanding \
> +		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
> +		   $(call cc-option,-fno-addrsig)
> +
> +CFLAGS_cmdline_early.o +=3D -D__NO_FORTIFY
> +CFLAGS_lib-fdt_ro.o +=3D -D__NO_FORTIFY
> +
> +GCOV_PROFILE	:=3D n
> +KASAN_SANITIZE	:=3D n
> +KCSAN_SANITIZE	:=3D n
> +UBSAN_SANITIZE	:=3D n
> +KCOV_INSTRUMENT	:=3D n
> +
> +$(obj)/%.pi.o: OBJCOPYFLAGS :=3D --prefix-symbols=3D__pi_ \
> +			       --remove-section=3D.note.gnu.property \
> +			       --prefix-alloc-sections=3D.init

=2E..this?

> +$(obj)/%.pi.o: $(obj)/%.o FORCE
> +	$(call if_changed,objcopy)
> +
> +$(obj)/lib-%.o: $(srctree)/lib/%.c FORCE
> +	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/string.o: $(srctree)/lib/string.c FORCE
> +	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
> +	$(call if_changed_rule,cc_o_c)
> +
> +obj-y		:=3D cmdline_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-f=
dt_ro.pi.o
> +extra-y		:=3D $(patsubst %.pi.o,%.o,$(obj-y))

--8ORzwRGnfaATysc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/yilAAKCRB4tDGHoIJi
0vndAQC4f+NCDSCyNXYj0njkGSVRxmlHAyLfwBzffl3veDQDTwD+Ll58OPQxpsri
ApRUvSTvYGRl+S21vQH6TERahcXL2gI=
=2KwQ
-----END PGP SIGNATURE-----

--8ORzwRGnfaATysc6--
