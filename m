Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792740799;
	b=ybUbyMfsJFiS4HohHTIPS0z4MxQGM6QJtDrSEVHV/6tTruLRLztmaXRfJ5iFmaJtq7fr
	 XdIywVsjofCGkRHjiUlPJAB+IRjbi3/25n745m0/MxVlQxpM34xeYILKIER7PIOqCq9AL
	 9eHN63h1L/RM/nsLlXjYJxEut+hPsKgneJc9PAySjHMHFcuZH2HnpDRQ9UNi0klEqXnnd
	 S8znYFtAmHEjVJMMkCRnR+LJTTe6/MP/BXx1kVbqUSZiGRRR9hRkKLLahpbiRwqJB5z/O
	 v9TkfgLvPAAp91S2HuM6Xb9HC8pUb4Ii7OtWFMIE8hML+7i7aT3OA8shyvo8cLul98g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740799;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=S6XKfn92IyUJY1cSUHMeiE49TgcbF+Rpj7AMk6zxFsI=;
	b=RQyjXZ1X80td2AbNtlf6Ov7jMK4FqKaY1/eUd91hly7XWnJhXziny8QMf7tO8MV4WURj
	 RMDkh84vmKz4yL51TTGWTfyECCN6X36f/Y863yzoi7Ey9G5KkAWlhRAsxvHG6dL0vo1Tx
	 X6QMoeEiE+qy3+NLmS/lYKj4AND3J6Sdl0XpeAPrvT5APIbhkfAKwcZMuCif3e2dnYV14
	 nb0yyOwaG1+z59kNe92aV90HTjtx6UMp1VIvpceqaMWxAgrZu7ZclueyN1/BR9CK0yRTH
	 smxzyrEya/FyJE48TAdQFAMAsHPnlzeFUtV7lWnHva8zS2V7KsSWsPMX4suaVdwxI7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RC1vF3/M";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C13606A31B;
	Fri, 23 Oct 2026 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RC1vF3/M
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792740798;
	b=EX7r0MqEBQ3EKUMQVw6PNM62Gu25262KXddPBfIKvCPw6l5gt+J2XYSlUF7+IAK1X4EC
	 vIsZoM1lMS873yZa9FRiaoHUKdsEMs1HPeZWJD0830dbLfCvI7GyYBQoIAc84K31Y9cR8
	 Wj19OF2wYcRbCu7tJaVLNascvjDqstdXvdsfw9QsvlwhVJHspssaJ+leMRoZ4jKd6Or/0
	 qzK4TgNHZbApJvtnuIIlblwVy1vk9U7MIXiXGCETzM9J6o6LWu9xilosnKYhPV0Vg5NdO
	 KsIGt5Sb/FZVnyUvO3iSC4JDx4kPfjcmIlDgzzTB6ZBRcRnYr6pHJrtYcH/ulcjGtjQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740798;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=S6XKfn92IyUJY1cSUHMeiE49TgcbF+Rpj7AMk6zxFsI=;
	b=jjobU7+XIz2co1vB/y1gABkIsPGh0Mw+X7ahMcAVsTGk2f7wTAfwrvBoTZonVaDgxf+m
	 CbDg39WUyAyKr3c26nxh0WRl9q5wqXHveFIXhzF4BK2DIqUSg1ewNNynUEHd+3uKHnbEI
	 lydc9My8sagjem+e3Xr56jZ0dBImLlVeeeswpGldybTlYyUamBokBsulpMapLyy+XGk2w
	 ClfcuHNbuq5pECTdKoVwBEbvbOVZ0E4TkAYRW4ndvX3f3LRS64RwtNYgn0r4ks+jc/SGJ
	 BGBxNxMXHCcseKBs1OoGIdrmFHwfmnKnRcMLhiva6RzC0UiJ2basahpikd6A+WkORMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF4F01F031E3;
	Fri, 23 Oct 2026 07:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792740798;
	bh=S6XKfn92IyUJY1cSUHMeiE49TgcbF+Rpj7AMk6zxFsI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=RC1vF3/MeAsKuTUVszHXQ5ECvxszAtQ9gABEdCdXJN6Yo3mq6naaPTPW5yxJ6ZDAL
	 Q1W8JtK4oJCPLRLFy6W9VWACqpoPhUssNCBIj2L5dpc0NkdDL8uEY5eowHAklPOkNW
	 NlRniTrMgX8sPizXhtmji753xvVBDlPIname+Y/5UBqIjfazbBzyu9qCSIkqpCuRgZ
	 EGs66NbTOc6uv+cFyj9yGD1gjeeUNDpWTgUrudmMxTwaCD+SUhLSYW/Twstu6vhvHs
	 1GgD6XY+XDSIlzGgYWuU2keYv1HJMkhIfrw9zY7P7X9CqmncFF6dmiKy/BEGLQbOjW
	 CjHuA+3IpadrQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3C65D443E6;
	Fri, 23 Oct 2026 07:33:17 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH 0/5] riscv: kexec: fix kexec_file with CMA-backed segments
Date: Fri, 23 Oct 2026 15:33:13 +0800
Message-Id: <20261023-riscv-kexec-cma-fixes-v1-0-825b90ea23c4@iscas.ac.cn>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBCF4VeRuW5AV9S2V4ku1vGYU2SxkyKI7
 95qlx+H/6xkiAqjS7ZSxKym7zGhOGUkQxjvYO2SyeWuLnJXclSTmZ9YICyvwL0uMPat1L7x51B
 JT6n9RBxDSq+3v21qH5Dvfkbb9gOHEL0ueQAAAA==
X-Change-ID: 20261023-riscv-kexec-cma-fixes-9bc69798a5cf
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Yao Zi <me@ziyao.cc>
Cc: Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, kexec@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792740795; l=1990;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=Thjxfmu56NJtgVUdSnPeX0m3Ki7icxN2HFTUo0uN07Y=;
 b=XDRVxrg/MPvhZsdxIHy3UA8cSlaAZoQOXZCJXfFOxKsAnZAwNXDEMiirk3dJXJ0NxyUn3KHzz
 ALTRjBPSRlUDwLRKSoyIDI9T86UgT2itnhAauIZ2jOmBuocOu7ukC1r
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

I ran into these while doing kexec_file reboots in a loop on a Zhihe
A210 board. Things mostly worked, but every few rounds the next kernel
would hang or purgatory would spin, depending on where the segments and
the DTB happened to land. Most of it goes back to segments now being
allocated from CMA, which exposed a few assumptions that no longer hold.
They are separate bugs, so each one gets its own patch.

Patch 1 lets the RISC-V relocation code turn the MMU off even when the
entry list has no indirection page, which is the normal case with CMA.
Patch 2 fixes the purgatory relocations, which assumed a PC-relative low
part always sits right after its high part. Patches 3 and 4 are in the
generic code: CMA quietly caps the alignment below what the RISC-V
kernel needs, and the tail of CMA segment pages was never cleared even
though the purgatory digest expects zeroes there. Patch 5 reserves the
DTB early enough that a CMA pool cannot be placed on top of it.

With all five applied, the board survives repeated kexec_file reboots,
including the layouts where every segment comes from CMA.

---
Han Gao (5):
      riscv: kexec: Disable the MMU before walking the entry list
      riscv: kexec_file: Pair PC-relative low parts with their high parts
      kexec_file: Honor the segment alignment for CMA allocations
      kexec_core: Clear the unused part of CMA segments
      riscv: mm: Reserve the DTB before scanning reserved memory

 arch/riscv/kernel/kexec_relocate.S     | 29 ++++++------
 arch/riscv/kernel/machine_kexec_file.c | 84 ++++++++++++++++++++++++++--------
 arch/riscv/mm/init.c                   | 18 ++++----
 kernel/kexec_core.c                    |  6 +--
 kernel/kexec_file.c                    |  7 +++
 5 files changed, 99 insertions(+), 45 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261023-riscv-kexec-cma-fixes-9bc69798a5cf

Best regards,
--  
Han Gao <gaohan@iscas.ac.cn>


