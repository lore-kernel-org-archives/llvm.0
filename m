Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E712E1F12F3
	for <llvm@lists.linux.dev>; Fri, 21 Mar 2025 22:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742594749; cv=none; b=NxJEIwWkLhvYn6/sAi526RFlaiW4f4dQp0XUisdny9imHVfDyLFwSYouf0usG3yDBdzdobhtWI1luysQ3KL/9rvwp0nJQgVUgiDWDOn/iis2MGbeeTM5n6Mcrdi7HA2BZpiGHFwpsuWO5g9q1keCLFcz6oqsLdL30FsD//TgV54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742594749; c=relaxed/simple;
	bh=GPWoxH3npdvl8WN2CEBUpA4DabBGBvrnSd1ljgk0us4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YbYuVt+LzPd6oPev58cqj93XIOIXI46LcWZrQvEjQyXR/sqBvfaTeNoNUkTxd8naWxORLBVua5SpxoOuexmiN3k6dbF5Ach84QhDWDO2S4OB6TCvam0vqEuIIA2suhMehBsPCiPRNAF3k/rzjCBnsjw+RnqE57bSIBo4mRIgF8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QJdncY3e; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QJdncY3e"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-225429696a9so58647945ad.1
        for <llvm@lists.linux.dev>; Fri, 21 Mar 2025 15:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742594747; x=1743199547; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeooS45TQglyMMDVF6rkeuWL2/GQyCi5QA5y17By+RA=;
        b=QJdncY3e68KM1LUCxywp7cOoCgL3jYW7VmhUihaPheiBAziUuuRiD1VoPx61Djm28a
         eWD1v7U8xPVd3Pw8EHuHgkY7XV/VMlsY+TYwKMgaxeKYcoYeMOpdMdvBAOmxmSIpJgdV
         wp+xDswya6LCG5dymQnHef2dEOStFiEkvmcDbsE9msnt5Hc4me7wIjD7IFqqgUJKlwBt
         p/+0OFoxt5RPxSvtMAAd5YkIfOi+yPEWwCT52zLwHZxCshLLCkkg2BIMSoqr2AFOQIQz
         Ewzp75MuQpu1SImemEJw8V3IByVr+kgwWzJJPnCcYdkQMsOQg7bi2u0qjvVk7Vl0R8a5
         6P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742594747; x=1743199547;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeooS45TQglyMMDVF6rkeuWL2/GQyCi5QA5y17By+RA=;
        b=rOTYwOcQ8dpdzB1kIwecdoctkdnY4zG1oOBgKDPcHaWHp9Jzu7xY2dIOItgiThALNN
         sbswaAyPGNdDzhIHhyxocglLk59hZ70AtDQEsIN+HrjLLNh3ZrRIZRVnZ2k3oZ7UmudJ
         QcQjxBsteTk7oBrbTVXIrzcRRRpoKqsFYSYjRwg6VYwzLxN6waRfpy1Xi4UO5wlnCIOw
         gCe88y+yPcPt7FDESkK8XG56jRSejljtXUQM9NtjSVgDC426kJdYj3ZVRYXckbqUroCS
         4gEcsNn6PvoYp6qxvLdwIxyNf7Em2btzu/I6GG1aSXyD2Mi8nv5PLBgsI+iFHS//ajLI
         DBiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXzs8k3uFuqsP+QQdQOPfBhE64xGI4E5Bv1VqfGdLzZGBuLm/KH35RB1sx+sTVHN4opmaY@lists.linux.dev
X-Gm-Message-State: AOJu0YzBOVDOXVBv9wag0x5HcKviJ1nBpwUphcvxdK84DcRGGg9UsyeZ
	mfLwclon7gNIpToGlOqI75H83+ZyPQUIMsadcXtfx37XC615lBpJK/09hFaWAgDImZS8tf+zNFN
	TWb59sZHTIDFkzIzpnw==
X-Google-Smtp-Source: AGHT+IH8oUHOd8cDU3Sg4aTfcA9eCg006OOlCicgX9+Yz8rj7I1UgXvDgxqTd/osjeg/tlyBTgtyuVc/MG3MozO3
X-Received: from plbbf3.prod.google.com ([2002:a17:902:b903:b0:224:5a4:9be2])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f643:b0:224:2667:8115 with SMTP id d9443c01a7336-22780e307eamr102834375ad.48.1742594747216;
 Fri, 21 Mar 2025 15:05:47 -0700 (PDT)
Date: Fri, 21 Mar 2025 15:05:37 -0700
In-Reply-To: <CAGG=3QUEY_Gmu-6K7rk6-y8AB7HVuV2V9sP5K3h379teAZXyHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAGG=3QUEY_Gmu-6K7rk6-y8AB7HVuV2V9sP5K3h379teAZXyHQ@mail.gmail.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250321220537.507917-1-changyuanl@google.com>
Subject: Re: [PATCH] clang-format: add for_each macros from libfdt
From: Changyuan Lyu <changyuanl@google.com>
To: morbo@google.com
Cc: changyuanl@google.com, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nishimura@mxp.nes.nec.co.jp, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bill,

On Fri, Mar 21, 2025 at 12:28:44 -0700, Bill Wendling <morbo@google.com> wrote:
> On Thu, Mar 20, 2025 at 4:59=E2=80=AFPM Changyuan Lyu <changyuanl@google.co=
> m> wrote:
> >
> > Add two for_each macros from scripts/dtc/libfdt/libfdt.h.
> >
> > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > ---
> >  .clang-format | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/.clang-format b/.clang-format
> > index fe1aa1a30d40..4decda7474e1 100644
> > --- a/.clang-format
> > +++ b/.clang-format
> > @@ -210,6 +210,8 @@ ForEachMacros:
> >    - 'evlist__for_each_entry_from'
> >    - 'evlist__for_each_entry_reverse'
> >    - 'evlist__for_each_entry_safe'
> > +  - 'fdt_for_each_property_offset'
> > +  - 'fdt_for_each_subnode'
>
> Could you alphabetize these please?
>
> >    - 'flow_action_for_each'
> >    - 'for_each_acpi_consumer_dev'
> >    - 'for_each_acpi_dev_match'
> > --
> > 2.49.0.395.g12beb8f557-goog
> >

Thanks for taking a look, but I think the list `ForEachMacros`
is already sorted alphabetically.
Am I missing anything?

Best,
Changyuan
