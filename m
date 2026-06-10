Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8685419C556;
	Wed, 10 Jun 2026 01:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055093; cv=none; b=aTIucN0qNDe7zgTaRnuMqQwwO83u5YOYbdBAQY6jorLAYq/iilSe/LJH1Eilc45/Swo2uRZpNDIIQnFWzj0J9/bxT3B3mZ80RMVv/oAOQMhaUWKBAQbv55cgFv1H6Nfp91JVbjOBkd7dOR9TPNXiUZmhx1dK07JSIftbpbSeWuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055093; c=relaxed/simple;
	bh=jX8yPtpLfo082EYodxQm099uzhz7yXG2rLZ5bXSmxRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NZEb5NiNCLEAn28iAITFzZXfuPAdOCsPr0nrz7ql9DTVJ3Tx0k9gL0F6hUyfxrfUzrKte9AHqbOvG11hKWB5DEabR6K472sdzGlluuQx33WHhL1bOg0WcGdak6SzLg3MQTMJSeJ9XuBoSrpuQqa5jISlTqHZh3//WRkIA4ocCXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cl+wZQcU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cl+wZQcU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B3D1F00893;
	Wed, 10 Jun 2026 01:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781055092;
	bh=8wSvSr5wgJYhG1T0+g2KEtONnq0QWojGMFssZM8uMN0=;
	h=From:Date:Subject:To:Cc;
	b=Cl+wZQcUQ0btce1W4WCJokjCCNBpEG4u/71kr35kGKxv368MLZBO4Tynuzore4Pjf
	 qNVwZLNzHpb3q+dPNTHkeRAvIfCa+XoAJq+CYCQMYidsA/EblfJ6NR87oIqXoeYk/Q
	 Ndkocd0APGtwvKlblhm6d8lbkFnbXkwnqajr3e7mWyDD9zzuiARjtsTKMZB7+rIiy1
	 xlxwT+UuEf2L7kMUooDCVhpRsjzQlYbt7SUzKWT1jsfMK0CXthkVXX+9fK3R1xnHZo
	 v1MnAxvYNEkpjKA0aMmX3P44/VSNkSOOVxGJ4t7waxeho/24GL1w0AuovYPUp1iiJq
	 cJuyIAQiG1aAg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 09 Jun 2026 18:31:21 -0700
Subject: [PATCH] MIPS: VDSO: Avoid including .got in dynamic segment
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-mips-vdso-fix-section-layout-v1-1-0e80ffadf7c7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDQAwAvyI5N7DmsFi/UnrQ3Wgj6spGxSL+v
 Wl7HJiZE5SzsEJdnJB5F5U0G5S3AsKrmXtGicZAjrzzrsJJFsU9asJODlQOqxU4Nu+0rUie2lB
 W0QW6gy2WzGb99o/nn3VrB4u+T7iuDxpQDjuAAAAA
X-Change-ID: 20260608-mips-vdso-fix-section-layout-262bc18d0c29
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4237; i=nathan@kernel.org;
 h=from:subject:message-id; bh=jX8yPtpLfo082EYodxQm099uzhz7yXG2rLZ5bXSmxRs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFka+wofLJfzPXsw55Pw/U/7Z9dYHnSd0FGRaVWk8cf1w
 Sf2Q2v8O0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEFloyMhzsT/UO/r/K+O3x
 M9N++F5p09F8N/Xl++pn635VxLSZ71jP8D/39K/iBW1mp5yWvHu//vGz3alWz/XEPcMOvyiLcPV
 M9uYCAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After commit 2db1ec80dfd5 ("MIPS: VDSO: Fold MIPS_DISABLE_VDSO into
MIPS_GENERIC_GETTIMEOFDAY"), building ARCH=mips allnoconfig with LLVM=1
shows some warnings from llvm-readelf while checking the VDSO for
dynamic relocations:

  llvm-readelf: warning: 'arch/mips/vdso/vdso.so.dbg.raw': invalid PT_DYNAMIC size (0xa4)
  llvm-readelf: warning: 'arch/mips/vdso/vdso.so.dbg.raw': PT_DYNAMIC dynamic table is invalid: SHT_DYNAMIC will be used

The blamed commit alters the link order of objects into vdso.so.raw,
placing vgettimeofday.o after sigreturn.o. This ultimately results in
the .text section shrinking slightly in size, which in turn changes the
offset of the .dynamic section.

  -  [ 9] .text             PROGBITS        000002f0 0002f0 000930 00  AX  0   0 16
  -  [10] .dynamic          DYNAMIC         00000c20 000c20 000090 08   A  5   0  4
  +  [ 9] .text             PROGBITS        000002f0 0002f0 000924 00  AX  0   0 16
  +  [10] .dynamic          DYNAMIC         00000c14 000c14 000090 08   A  5   0  4

Changing the offset of the .dynamic section causes the dynamic segment
size to grow by the same amount, which triggers a warning in
llvm-readelf because PT_DYNAMIC's p_filesz (0xa4) is no longer a
multiple of its sh_entsize (8):

  -  DYNAMIC        0x000c20 0x00000c20 0x00000c20 0x00098 0x00098 R   0x10
  +  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x000a4 0x000a4 R   0x10

The size of the dynamic segment was already incorrect before the blamed
comment, as it should be 0x90 like the .dynamic section above (18
entries at 8 bytes per entry); it just so happens that 0x98 % 8 is 0,
whereas 0xa4 % 8 is 4, so there was no warning.

Looking at the section to segment mapping of the dynamic segment reveals
that it includes the .got section, as it is implicitly placed after
.dynamic by ld.lld's orphan section heuristics and inherits its segments
from the linker script.

  [ 9] .text             PROGBITS        000002f0 0002f0 000924 00  AX  0   0 16
  [10] .dynamic          DYNAMIC         00000c14 000c14 000090 08   A  5   0  4
  [11] .got              PROGBITS        00000cb0 000cb0 000008 00 WAp  0   0 16

  Section to Segment mapping:
   Segment Sections...
    00     .mips_abiflags
    01     .reginfo
    02     .mips_abiflags .reginfo .hash .dynsym .dynstr .gnu.version .gnu.version_d .note .text .dynamic .got
    03     .dynamic .got
    04     .note

Explicitly describe the .got section in the MIPS VDSO linker script
after .rodata, which switches back to the default text segment,
resulting in a dynamic segment that is the exact size of the .dynamic
section as expected with no other layout changes.

  -  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x000a4 0x000a4 R   0x10
  +  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x00090 0x00090 R   0x4

  -   03     .dynamic .got
  +   03     .dynamic

Closes: https://github.com/ClangBuiltLinux/linux/issues/2166
Fixes: 2db1ec80dfd5 ("MIPS: VDSO: Fold MIPS_DISABLE_VDSO into MIPS_GENERIC_GETTIMEOFDAY")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
The fixes tag feels a little strong since it seems like it has just been
luck up until this point that there has been no warning but I decided to
be conservative and include it regardless. Feel free to remove it if you
see fit.

I think this should go via timers/vdso with the blamed commit. I plan to
send a follow up series for 7.3 to add '--orphan-handling' to the MIPS
VDSO to avoid issues like this in the future but that can go via the
MIPS tree, as it is not really a fix and I will need to properly test
it.
---
 arch/mips/vdso/vdso.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index 05badf3ae0ff..278ab6444e98 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -56,6 +56,7 @@ SECTIONS
 	.dynamic	: { *(.dynamic) }		:text :dynamic
 
 	.rodata		: { *(.rodata*) }		:text
+	.got		: { *(.got) }
 
 	_end = .;
 	PROVIDE(end = .);

---
base-commit: 13f6218e6fe79dc64aed76d738b765b45f62492b
change-id: 20260608-mips-vdso-fix-section-layout-262bc18d0c29

Best regards,
--  
Cheers,
Nathan

