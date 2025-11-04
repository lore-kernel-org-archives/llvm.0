Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964852D0638;
	Tue,  4 Nov 2025 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294502; cv=none; b=YpTLyxqJjwapTUzYCRFgZ47Lc3CSu6tZ6J0Ql+Tiv39oOwKFNW4CpqMMY2FZ+3y20ksrqTuE1LHQfHh7HG8Agi6SpKYBy/GUaEQdiYN+lVbQh/i83tbmp25KmaMWxn+nOw+9cYErDgR7Rlm18CqiDFN6m79bcg7fXxvYEYa1wcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294502; c=relaxed/simple;
	bh=v+esQas1JeFF71JBjf0xMHyo5U6oIXQScKc+wNUW+b4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nSDjiWNeOfg47p7YK7i7CCETzGuPlMEfpEpzGfbxnfl9tCmScFaI+EqU9KLLLppt01ywwrANyPCiypMQE+YHOjy7XLG94duCNDUyV0m/kl8lIhXOF+c2ydDqgiUmoUi9tEe6uYfHVPwGpCo+nisBWfCH+9LxO1BKpuwjeGqdzOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NKO+ZrBd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NKO+ZrBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB352C4CEF7;
	Tue,  4 Nov 2025 22:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1762294502;
	bh=v+esQas1JeFF71JBjf0xMHyo5U6oIXQScKc+wNUW+b4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NKO+ZrBdlfWjXd7WcH8GvFLTdQ8JhCsYoHPaEI3BlWJ0L9mb8kfb3Lhx3q8vaE2nO
	 DRYUyhnk+Jm7YdZ6e0jqH2o0QTng+MGhcG/Zq8etPnI5M+/Naz87pp0BwSSRGiABp4
	 wjfWtSRynhiQgTbCTGOOnAaKP4mJ7MLH0cu3XRgc=
Date: Tue, 4 Nov 2025 14:15:01 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 4972/5926]
 kernel/kexec_handover_debug.c:16:18: error: use of undeclared identifier
 'kho_scratch_cnt'
Message-Id: <20251104141501.48a1f76a3f83967f08d00097@linux-foundation.org>
In-Reply-To: <CA+CK2bBnorfsTymKtv4rKvqGBHs=y=MjEMMRg_tE-RME6n-zUw@mail.gmail.com>
References: <202511042251.paO6f5BZ-lkp@intel.com>
	<aQod7jDFBjw9T-u2@kernel.org>
	<CA+CK2bBYF5AndNHgqcb5zDbUOV04nE6xiZ0igcTdYf-GOU4aOQ@mail.gmail.com>
	<CA+CK2bBnorfsTymKtv4rKvqGBHs=y=MjEMMRg_tE-RME6n-zUw@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Nov 2025 12:50:49 -0500 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

> The fix looks like this:
> diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
> index de4466b47455..2a8c20c238a8 100644
> --- a/kernel/kexec_handover.c
> +++ b/kernel/kexec_handover.c
> @@ -477,8 +477,8 @@ static void __init kho_mem_deserialize(const void *fdt)
>   * area for early allocations that happen before page allocator is
>   * initialized.
>   */
> -static struct kho_scratch *kho_scratch;
> -static unsigned int kho_scratch_cnt;
> +struct kho_scratch *kho_scratch;
> +unsigned int kho_scratch_cnt;

This patch is making changes which are already present.

> --- a/kernel/kexec_handover_internal.h
> +++ b/kernel/kexec_handover_internal.h

Against files which were moved to kernel/liveupdate/!

> Andrew, Mike, do you want me to resend the "[PATCH v3 0/3] KHO: kfence
> + KHO memory corruption fix" series with the fix included?

A little fix against what's presently in mm.git would be great, please.
