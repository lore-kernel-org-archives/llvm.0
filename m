Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3EC34B68C;
	Tue,  4 Nov 2025 23:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762300452; cv=none; b=ZEqRapK8mcmB3e7Ey2Qdp06WWWYrsMMM896Wb8jmhf8yQVgXJy8xFDtOSAUVHjayIAfx9LydgOcX3CELr5xVDQEIoGXl/PDbI0J+IT1u/OXZy7m2cu+mQvkNAU9WF9Md9VYVwn71UGwHQ3y0nvzxGJSUHeg/T5GSNubQQM3v+yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762300452; c=relaxed/simple;
	bh=h1mJHUEMMu+Mg5BL63eKMqT17Qr/sGrDoUVMa+6rcbQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gr0sFUwRd5U6SL1WXOCZwR4FDw1ObP968HsR21nPzjndbVsbaF9NaP1pDNbGgHdNEoiv/yXaHyXQShxNjUuoI6KvZjfn+r1KeeDoLS4688RtS+AsNOgFC/WN0zIsEzKK8TM17azrAeKal9IbB4aQwsaxjJXJKCJnR6DL9ecmgBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RYbXhYat; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RYbXhYat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA070C4CEF8;
	Tue,  4 Nov 2025 23:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1762300451;
	bh=h1mJHUEMMu+Mg5BL63eKMqT17Qr/sGrDoUVMa+6rcbQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RYbXhYataf5TgADzE6aadgbMz0TJb9bjEbRi33FOl0bTfA+k76mXrW5WFw+Vu/qFE
	 lhVUbZfcD25jWdsWejm1YyJPzNqeBpmm5tJlMLmyJ49I+WD0BuNQ1vbHmkvoIId6Fe
	 tuCFq2rGA9lt8ctacb7rJJn1EhsWGv5F4MeKJTo4=
Date: Tue, 4 Nov 2025 15:54:11 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 4972/5926]
 kernel/kexec_handover_debug.c:16:18: error: use of undeclared identifier
 'kho_scratch_cnt'
Message-Id: <20251104155411.64385f0726ec775d9f31f61c@linux-foundation.org>
In-Reply-To: <CA+CK2bBJRXX5u9sCkG+WKW_OK1biyBUfdcJ73yuUdeNv6QevbQ@mail.gmail.com>
References: <202511042251.paO6f5BZ-lkp@intel.com>
	<aQod7jDFBjw9T-u2@kernel.org>
	<CA+CK2bBYF5AndNHgqcb5zDbUOV04nE6xiZ0igcTdYf-GOU4aOQ@mail.gmail.com>
	<CA+CK2bBnorfsTymKtv4rKvqGBHs=y=MjEMMRg_tE-RME6n-zUw@mail.gmail.com>
	<20251104141501.48a1f76a3f83967f08d00097@linux-foundation.org>
	<CA+CK2bBJRXX5u9sCkG+WKW_OK1biyBUfdcJ73yuUdeNv6QevbQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Nov 2025 18:12:24 -0500 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

> > > -static struct kho_scratch *kho_scratch;
> > > -static unsigned int kho_scratch_cnt;
> > > +struct kho_scratch *kho_scratch;
> > > +unsigned int kho_scratch_cnt;
> >
> > This patch is making changes which are already present.
> >
> > > --- a/kernel/kexec_handover_internal.h
> > > +++ b/kernel/kexec_handover_internal.h
> >
> > Against files which were moved to kernel/liveupdate/!
> >
> > > Andrew, Mike, do you want me to resend the "[PATCH v3 0/3] KHO: kfence
> > > + KHO memory corruption fix" series with the fix included?
> >
> > A little fix against what's presently in mm.git would be great, please.
> 
> Hi Andrew,
> 
> This is because in mm.git you have patches that move kexec_handover*
> to kernel/liveupdate/ (and they fix this build problem), but
> linux-next does not have these patches. The patch I sent is a fixup
> for  "kho: warn and fail on metadata or preserved memory in scratch
> area" patch.

Oh, OK.  Please tell others these things :(

I think I have it all sorted out, thanks.
