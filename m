Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CAC3F164D
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967277; cv=pass; b=YYvAytuwUJLXJT8sH3yhGvIXhGKsdHFz5OBE4FrqhCKJIlAFrq1CJGuBe6DYPCHAfmJXuFcz1haF343Iwzrpd4F7cQym6UZUfpQssdMxHWMDmTIctrKjRxWH+fEB+3TmA05uMbg7C7FY4AUdvLFEqNLgUsrHw/xbg8ZHE6vsnCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967277; c=relaxed/simple;
	bh=umH6HyQOgTxau9kIskod/Xg1ilIJ4AZ0/NF18I0pxRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=smz3JZUu2Pk245Rjxby0VQDcWHUH584YiS2nNZ9j/jRe/OQfZyu1zaLoEJ4nK48O+QTrvDMame2N05G9lrJzqvPlqXTIkzW47WtZ8A9yvmqGwbwux88wdIzjB25gCzk6larm75HD8i2tQkKxytcKCPWKn8/B0Od2vI+JRGvIXLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6HFeJpC; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6HFeJpC"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso3806485a12.1
        for <llvm@lists.linux.dev>; Tue, 05 May 2026 00:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777967273; cv=none;
        d=google.com; s=arc-20240605;
        b=Rm9v63kha/2a+UfmYx//l9LEMJA/xtKoxE+pY0JqZ1BK9wY//oH7O8ZVVflikSGUsS
         99ThMsEkP/t9/CR3EWty1E1uLR3d+Gqz/uFgtAEs5GfBg2TUTH2zz+IrCvW1bvfoqPeI
         iLAhdnRYroSXunqD9rx+YnxJnd5FVoUOUSSTddLRN0Dd8ByLezZ88tEoQWga8Gozgvfo
         tbFdKAC6piGeWf0yQjR9R8GabWxEemJ5W+tKK+qGKH6UFTXTwAXy+F3flvfab1FutG9d
         vAA7JX4rhNAn//501D143aJi3JKbxTbkIzdDTtnulUZYGu5brsXsOcx4nJJzML2vK2fw
         RgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LrEQHam8DGEcHyD+7jduqW+Fi+mFl53/8fjm+HcTlGY=;
        fh=8vdGFhinNY7C80G3/i4jtIg5PFQ4iUzW8NenMyPcqx4=;
        b=BJrAdpKQAXhCZY1BSpedk+5Ij6ZBvefT2aMROxQw+smqt4lEPcuOWp+5L2s39hRItO
         vS8YD2GFhK1pgx6nn+jePKLKqyT2yqChwu0COYI6VAT1WS0I/4SYsUfR2iawQjduYOHh
         8NremvXiHjD3igh80BGKn6+dfq+XFMj+zy4it5ZOmWa3FQXIJr+tpFmeXrJmZn96MR2z
         Ollhk4/8QrbV8J/msSZLwUo6LvptNWpt7sO7+HFuyngO+kPtbopejeoS9q3+pBEm8SCI
         Y0BYV8NzZQ18j3IjvjRBU6fKbipX+wpcF7kCD/mdr3KdtU7DplUWRHGakuIWdOx69p8J
         uoYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777967273; x=1778572073; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrEQHam8DGEcHyD+7jduqW+Fi+mFl53/8fjm+HcTlGY=;
        b=m6HFeJpCf18ix+sls+WuOZwMiZFBM8szV/sF28BSYAdP2fV+6Mgv4GYK7OESadFyDQ
         sm2eLGzZ/qmV7UkbBWO5D2g2VuMTzGX87p6VjJ2MUI8LMlf1uSBRUKeUtsoF0aGAEl/R
         7Cvdy9Hufm9DzgzTCBzPKmoBKQ9N8XRZjYA6dNl52J153+T3zjI8dOi2X6gd5b1TkuYZ
         T9EVLoyiCYCaCnXnMLBF5sZVusj9Gsh0DMpXVka2owd8LbQUJ0Z9CKUbXwdTL0SqCoeV
         6r0rExtfCr1F1pjbYU6wbQmviahLolG/RIy9uencoJTo7Gt6+DJrlb2+gQc90ZPPWbys
         JF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777967273; x=1778572073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LrEQHam8DGEcHyD+7jduqW+Fi+mFl53/8fjm+HcTlGY=;
        b=N1EEgGzxiBdtX2ogpcVKu2kLK+/Y1b3pxEEKFMZnVPw26ev1xhrWdf8g/MP1Gdz1zj
         p6Ing4PFVKdd24WN0DJLG7AgvS7Q8zXZ28D8YVKm7zPbwoSiO7UDDbpJQNdHjw6707Gr
         T5ZSLtl7twCaA93mRtenzNrFZ+sLaJJ7CiW8KCyelFpvrBJwbdMKfC/VhO3SCxRjs9hi
         c8bdsQvyYNAfU9VDrJCX/8yWphtG3WeWULov7K1XuGSo2AZVY8W2VQhScxtQ2tHauaVP
         lN4718VRt8gGfyrrKyg968+I91tVn0SMuf1Erk3mbLIVy7UZRY469aYkbkJU6cl/Jt3w
         0lDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pRZRyj+sovGuJd183cwU38o6OCGsIjXWaOEt9EH3ZakXOz/GhVw54UhQvsIIPEqwFrGiC@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7vQBHkdaAgpQGhEP0ZR5er3/Um22y12Ve9GztwBJN/kMJSlQN
	mnX1v9mZGqRoSMir0sAb3Qw4spftx8ydfMKwW9MutkTEJ4v5qD1c7zG6SpxdcmaiNZ6/bo2QARt
	XDhw8ZCcwendslDgotOVozMUF7H4gB/g=
X-Gm-Gg: AeBDiesQEoEXjQogu7m5ao3ytHnIHJ6qO1JGoBwWlOttKyeyrzr3IgkYNJVtc8zTVTF
	d9n/Dil0QzRVJ9xBWZ3mCceqfHrgJ3UnMOn+XMNZzDAM+8jDRLeUD6sXMApPvnd8tfCRuJOyyDP
	/d0+59PkJdibA+EU3GOB715Lap4mZGXy/qzrfK7y79ckFc53uyNLfAz/+GGHPtDhaQNNBTu5Gln
	a03vv5I+Zdt0i4rZ3gThjoAU07VJ7rYT/O7cwb41ObdQTOOvSnZ0Z2nQbFndmkVIycKYIFGBi8t
	KEh7W0r6f13b9+2biRVAiwfGmQfKvZTznmKvD2LP8ryMDZES/P7lor5ibXS1n2j7OqsJVNBqOOJ
	YvM3lq897sXKXApoviztCoIVBirWN1HqIRHH632RTFxywbidOkbWY0AFnR4WNQaI+QtohH09P5+
	goRTA=
X-Received: by 2002:a50:fc03:0:b0:66b:f527:c69d with SMTP id
 4fb4d7f45d1cf-67ccab1cc90mr656287a12.8.1777967273017; Tue, 05 May 2026
 00:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505010112.645361-1-rosenp@gmail.com> <0f11390f-e8bd-4f8d-aea8-59ef545b2c32@app.fastmail.com>
In-Reply-To: <0f11390f-e8bd-4f8d-aea8-59ef545b2c32@app.fastmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 5 May 2026 00:47:41 -0700
X-Gm-Features: AVHnY4Ktv2gBjkmdWbGk1dG2dc4G9oZ10kiw93sWZlLBrxmklnYBHgXj4r1U3So
Message-ID: <CAKxU2N92s06-L0+e=KZ7EbtU50tCpaCk2MYJD2xTFEHEsAhXUg@mail.gmail.com>
Subject: Re: [PATCH] mm: move phys_mem_access_prot_allowed to header
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 10:54=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, May 5, 2026, at 03:01, Rosen Penev wrote:
> > phys_mem_access_prot_allowed is only implemented for X86. For others, i=
t
> > returns 1. Move it to header to avoid using __weak.
> >
> > Fixes compilation with make LLVM=3D1 ARCH=3Dmips
>
> Can you describe what exactly goes wrong here on mips?
Cannot find symbol for section 4: .text.phys_mem_access_prot_allowed.
drivers/char/mem.o: failed

It's full of similar errors in drivers/pci/ as well. clang on MIPS
doesn't seem to like __weak.
>
> > @@ -239,12 +239,6 @@ static ssize_t write_mem(struct file *file, const
> > char __user *buf,
> >       return written;
> >  }
> >
> > -int __weak phys_mem_access_prot_allowed(struct file *file,
> > -     unsigned long pfn, unsigned long size, pgprot_t *vma_prot)
> > -{
> > -     return 1;
> > -}
> > -
>
> Removing __weak functions is usually an improvement, but I think
> we can go further here, see the discussion from last year at
>
> https://lore.kernel.org/all/20250520152030.1499670-1-arnd@kernel.org/#t
I hold no opinion on that.
>
>      Arnd
