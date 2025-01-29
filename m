Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C951E25EC
	for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 21:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186152; cv=none; b=CxSzDM5WO/6N9goakoampEsQ75LhzYfk9LhmQsULJ538xs9VldOA795rcCycBPmXGX7eNiQ5xOV238U+MNZMAr1IgDBlzdceQQsCPIPMq96oW/OvO5b48QJb9bV9/52eLzIDtVHxGPCV5sD3fVFihxtnnubJ6anPn7rv5AG/SRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186152; c=relaxed/simple;
	bh=c8nW3ZmYDs1X/So5oD/3bpCh5qukpkvLJpoz+Jwk82Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=lyKXF9WPZT9zHItoj0wPThxPD11TUQCFpto/jvqAV/9SmU2uPA01nCS58Fy1DnAN7JgcAz004lxnaY/nnRXJVE1oB3O5Wc13GWqIJNcmzKPbAE6Jh6IC6XzF3Mfnya/Br9TlZHkBUmHo1dwZWvkZEFlUAM9f+Kb574xcYuINNHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJoe+XBw; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJoe+XBw"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3061513d353so520271fa.2
        for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 13:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186149; x=1738790949; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT0rFmaKToeuXSjRSzkL/lRENUooY068EpzaG7EWYO0=;
        b=QJoe+XBwyLyRYCMHRMQhVv3+JkEHLMvJPIAhE6UQoUWfS0EGlUh/fMqOhGB6BP4x3A
         2hVu+rmnZBkXSUm4b4373nY6q0fDJ1PxLPu1NAxIDrcndckO/S1QjADKQuxVLZMglREg
         vyxMCooYrdg0S48Qo9NX1R6vNFBmVqD981wiuhbpHBG6r5krQXVaoEquzCj7rrbR1sbF
         zpJ9FcReKG5UMTkVyakGOvYlbo7lbkzHhTfiG51VjmUj6/MIKxeMkJI338pl3mPJ8EHo
         LTRJCi0jviv3h4R7vFD+U1jubkPOqWeMw2FBizpq9fLcg7TIs8epihuNnECvXOMtIRv4
         +/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186149; x=1738790949;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GT0rFmaKToeuXSjRSzkL/lRENUooY068EpzaG7EWYO0=;
        b=KlcItJlYGk1EN94VHUn3ZamJnjFVRiw9eEyqo15YkR7H7Zo1884OH3PUbxiaIUNtHx
         bT54Pd57ai1ZeulVeh7FW0MTXEXGMpC+cb+1XTMWD+MtA33BJk1kaZn2uNq5v7tpB2/K
         X9dS670ndosfw5DTlP4JuVLbGGjrbamika8s6tlCyuS1HblJTZ366zclMO8dv4hBLgh/
         fxGjwCHRWNnMjQ6+cnb9sJGlhTt9DOlgHZovltdK0F5+dPaYYSy2msIVAHYFi4oeCTaC
         FAXoxJVDmoqyAQrFgCja2BagdqeBUQ+rm4UIScoAvbrFpha8ssR7UF+NRsrGNQtDEx+q
         cb9g==
X-Forwarded-Encrypted: i=1; AJvYcCXD3mJutvI7xfzyumk4JRYf0Emf6F3pKI4iLy60plqso6qsRlXwA/4K1Iz8HV6gZmCulgtX@lists.linux.dev
X-Gm-Message-State: AOJu0YxUgjA1l+jBOJYGH324QYmH51Xz9ZENByNBmSa6AmvytoOxK17c
	lF+eFWE2Wlbn02TXRwbR4n2A6ez95onXkr+u058iAV5NdePVWWL1XNBtoyq8sKmUjT37B+/5ECo
	ACInqiNTBsoaZEQu8RV26GpcfD2Y=
X-Gm-Gg: ASbGnctF20RiRe4HhnB8Xa8td8EnMXCXZUCUjumFENlQ+tSCEkXJ7ubnJSF/88S2Pgj
	CvAuM2HS7elnsHa9Q7FQXXSrMFH5n2lv8pfMN3/JxKQR645WmSWI4TXlcjcNyfx04D6vI8n7szr
	qXEUaaMQLFSqtcGN3MCErHj6MgsilW0A==
X-Google-Smtp-Source: AGHT+IEini7TIAvHWFfZWJAA/DIhlgY7ELxTDYTMmVhvFmOP3+WEeVrbZSpqp7JMDeFBEGMKPTMSdGVLiQ0G7+RO3zE=
X-Received: by 2002:a2e:bc26:0:b0:302:49ba:2550 with SMTP id
 38308e7fff4ca-307968572cemr17704121fa.21.1738186149080; Wed, 29 Jan 2025
 13:29:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
In-Reply-To: <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 16:28:32 -0500
X-Gm-Features: AWEUYZm30qzC7OYicUCyM7022EFlqK5dvrSLqA0Ri2_QEk_6Vs9gveN9uXDYy-8
Message-ID: <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	tamird@gmail.com, akpm@linux-foundation.org, christophe.leroy@csgroup.eu, 
	geert@linux-m68k.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 4:26=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Sidhartha Kumar <sidhartha.kumar@oracle.com> [250129 16:02]:
> > + Liam, Matthew
>
> + linux-mm
>
> Thank you Sid.
>
> >
> > Hello,
> >
> > I believe this patch needs to be reverted for now as it breaks the
> > user-space build of /tools/testing/radix-tree with:
> >
> > In file included from xarray.c:11:
> > ../../../lib/test_xarray.c:9:10: fatal error: kunit/test.h: No such fil=
e
> > or directory
> >      9 | #include <kunit/test.h>
> >        |          ^~~~~~~~~~~~~~
> > compilation terminated.
> > make: *** [<builtin>: xarray.o] Error 1
> > make: *** Waiting for unfinished jobs....
> >
> > this then prevents the maple tree test suite from building.
>
> How are grammar corrections going to the right person (but not the
> mailing list) while an entire conversion to kunit is not [1]?

Very simple: the tests are not properly included in MAINTAINERS. I
sent https://lore.kernel.org/all/20250129-xarray-test-maintainer-v1-1-482e3=
1f30f47@gmail.com/
a few minutes ago for this reason.

> Does the patch really need to drop the module testing too?
>
> What exactly is the point of converting one testing system to another
> besides disruption of actual work?  Who asked for this?  What is the
> point?

All this is described in the commit message.

> Is anyone doing work on the xarray running the kunit tests?

I was doing work on xarray and I was running the kunit tests.

> This should be reverted as it should never have been merged.
>
> Regards,
> Liam
>
> [1]. https://lore.kernel.org/all/20241009193602.41797-2-tamird@gmail.com/
