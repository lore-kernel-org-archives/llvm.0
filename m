Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6438386C25
	for <llvm@lists.linux.dev>; Sat, 26 Sep 2026 04:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395216; cv=pass; b=V7W6XT9mpYPL24Sj9sjcPYVx/pPXrkX1QBeiZ1tuEL7Onz1Ja9nWXl0JB64hwKOpHzNO7QHsv0uQHX9uI/d0nmgAFBggmBk8SvMbhqjl3oiipO5UC4vL+IlLQSPm9nAvVX0bhdakc9w8vq0o3MAUX1y+nextgfdzL4UalGk7jHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395216; c=relaxed/simple;
	bh=8Y2bsAkSTZILhk3+rv+DzLT4+GI9Kjxt3IAQHjbMyP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obqMjFMVgQsJz3JR+kUf171hsMOJTSLaG3fs35nPPGmBZGimp5yjjUFDYcK3xPO56jIxYHxgho7CQglu1wxJFHixI2q+mIcUlQNy6YWcRItDHtVksUsMPwjNMeeBPOOmZGgWfJ9HhSPlA9v4ECF06E/zE/whxrrT3fsgMY3QkHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mbteho6x; arc=pass smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mbteho6x"
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7ac5b4011a4so931402137.2
        for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 21:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790395214; cv=none;
        d=google.com; s=arc-20260327;
        b=kehBWAayaC1qqUGQ4L4AQfk92K9qq+jQ7cnBd1WJWuICVDApKA0GQrmEcu3RH0exU2
         sfvfzMsPDPb143/0pWtdZmHT2pgecZlJ9h2Zwh5NWLECxcP1obx3cpR57gwkaMB632VO
         pGTEny/b3eKatxUjEuxkjDAWk+z+yacxqYez3liKwV8IWWM00eN1x1RaoSr/sE46bA92
         JqZRL1SNJ3xMIzp8TzOmXAZGaEH+uPWNMXtGGB7pJMFXzTU35pNAnYngXNjej0ZBxcvS
         Qzv8JBEvRV0dAwIhAFv9hojE0/l4TIAOod2jLNuAuanVXCuDAscRiFH8d6rVJ29ak98j
         DQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MYpeyRZV+TWw0zn+XSYzCNOx9+tm8LCGwN/L1KGsoYA=;
        fh=DJmuG7oxpoAoWAsX6aksWUwhAK8jyywYhIVoNGiEZIE=;
        b=cGugWvPBAkpZAcI+ljB5xQ5hxRIMy/fZhWK1mxFY7BNpVKfHMY78+9oNKtOegpsaLb
         bNXK4jj9aggj9YW1EwuDUFiXQQ3Nxg9OZ/MmBAg5Xj9Ef1LEIyG3sm9WkLNvlcvlwS+V
         G59fRGyQDezlnHRQZYQSmxsNjbEQAl7o3M14O2chC5r6cK1+qh08l4friH/OJGvHHeCn
         PXhDPGj0cmFsuiXfQN1PCOGrBob1SnnXyF5HHU5QNy2GvU6nsE+eacTugjj7FIdgshcj
         6rn2pVEeMV6LqEPZIWvwxSguKfwzIvR1WiCoSKQIFQhoK5fE0eXwd5eRkwHeZJIWQMfm
         DoNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790395214; x=1791000014; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MYpeyRZV+TWw0zn+XSYzCNOx9+tm8LCGwN/L1KGsoYA=;
        b=Mbteho6xToCCkXSOnewIln4O0qy/jsYw8LI79xVYu2zVZh1Zyz+wWjasSS1HDoc9+i
         In51P+sGPfklPatJ3pytEqDDtvMFB4p0saDGcWKZrrqkYR1ZwmuFxpgOLO4nNPjx6iWe
         SPPFwXcGEZwaNmyrhmUyk7Diqaqwm3U9v5p7ZdepFFKzBNtM1gKKqxgARwcE20Za1fLO
         1QDcuZjsDKCyi6aoT5fiEr20qxJZD0MREf+zk3nNpEin/wmzZvJvD/S9fg02UJM7sV1o
         FKMuAbuonmI6JPWJZJkXDwnT+UtVLAea5WLoDu1EZisnczn4ogaXBLIhzc/P51A+WVSb
         xllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790395214; x=1791000014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYpeyRZV+TWw0zn+XSYzCNOx9+tm8LCGwN/L1KGsoYA=;
        b=J2jh0PiTFCLAN5ZfZELrUXyvnzCF+0ZtSEbG+AWt9jtfLnrVIKiS/ZqF3jmAiOH4+H
         0CgaAUhRkUxTQLH27oKcpql7RSb12woP1juxDz8nkeUgDBGOI6RiZx1F9/pid8iAtKwR
         tW65vXqdv4iDS+orDjKfyURihlSLjelOZ2mSxcsdj5CYuclR3Gnd/MEXy/UFWOdUHfmB
         2XvisBQS+pq0h80YljZj6udGRWPmYse9aZPjgslCTLqkBpRq1hWDZ+CYMOzpwfnIDalq
         XItY9uE5BlcrAMgy5y66Tccq0bndKSyMuD1SR10GVF1xb2ne8sLpEw2KOY6BBKBdmZV5
         TO1g==
X-Forwarded-Encrypted: i=1; AKwUvBw8Lkl6pXnbkf9gkGuPee3w40+MosfdQu1RHy2lYWicthkkgxnOm2MMGrEFHhSDBRBdMrcU@lists.linux.dev
X-Gm-Message-State: AFuF++k9cFsfJSgjKmJ4VWLTzclMGvjn/dRljqaEOAO/6WOmXmPMyXXT
	B4fsdpo4O2y6+8ja+fXBqw3NA1ZGCecqAQ0OTqdqM5vpYrAMADh8ecUIv066WZ0Cjn40/3A3PWn
	RSSJg+mEHxtN+ferf29KYsImMQcU0SR6sU5YcEIA=
X-Gm-Gg: AYBFou3nXZKcVseVQNO4+dAP6JGLQVXvk//IKzRnt6USmrNLy8fx5kdp/VB9AUODJbu
	Rg8lT2G2xfCeVDRCeJbIB2qoXH4Be0/gkuxY0Eq8MGo8SV8g8SjdziyyIKf9kyjx5eLbpqBQWR5
	9hjy/WD4Z3Ol8lIZoL7HV7H5ur5KwKNXJOwda0OTPZDZacEx/0ACD1f7ygmcmTb51HQ9rMg4b6b
	nhnqHQ//2vqHGuywbHfbe6coGuDJgHIg3Jt4ofjKlXiZwcUyoPDajyKQytmCAA+4IK6u+C9f30z
	cbxnTn3p2oXgQt+Ba2Sj0rUIRVYJYSmc7PVz+NmIl1aA3y7s6U5z7kQbeZ6qIqEVTn6uQc43V75
	lZaQ6VyOLb1KhOz/cIN2C
X-Received: by 2002:a05:6102:290d:b0:7ae:da60:5dfb with SMTP id
 ada2fe7eead31-7af1bf73808mr3668288137.13.1790395212940; Fri, 25 Sep 2026
 21:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923055320.2602534-1-morbo@google.com> <a51283e0-7d55-4d06-bf7d-3cd7b7a21faa@embeddedor.com>
 <202609230021.7F6F2140@keescook> <204fb990-7b45-4ce1-8e6a-260538bfb678@embeddedor.com>
In-Reply-To: <204fb990-7b45-4ce1-8e6a-260538bfb678@embeddedor.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 25 Sep 2026 20:59:56 -0700
X-Gm-Features: AclHuK_iI1gG_woeJMTGNDN_cmjTZYiMNuN9pp2RmlztTl9u5AsCWNOE4zKQOyY
Message-ID: <CAGG=3QW43-Kez+FkRM=SuZtbJ_ODgVXY1nrtg7BTYG_OgP3kBQ@mail.gmail.com>
Subject: Re: [PATCH] Drivers: hv: vmbus: annotate struct vmbus_gpadl with __counted_by_ptr
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Kees Cook <kees@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 1:02=E2=80=AFAM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> On 9/23/26 16:23, Kees Cook wrote:
> > On Wed, Sep 23, 2026 at 03:10:08PM +0900, Gustavo A. R. Silva wrote:
> >>
> >>
> >> On 9/23/26 14:53, Bill Wendling wrote:
> >>> Add the "__counted_by_ptr" attribute to the buffer field of "struct
> >>> vmbus_gpadl". This allows compilers (GCC and Clang) to perform
> >>> compile-time and runtime bounds-checking when KASAN is enabled, preve=
nting
> >>> potential out-of-bounds accesses to the GPADL buffer.
> >>>
> >>> The fields "buffer" and "size" of "struct vmbus_gpadl" are assigned
> >>> exactly once, during GPADL establishment inside
> >>> "__vmbus_establish_gpadl()" in "drivers/hv/channel.c".
> >>>
> >>> To ensure that the count field ("size") is initialized before the
> >>> pointer field ("buffer") is assigned, we reorder the assignments in
> >>> "__vmbus_establish_gpadl()" so that "gpadl->size" is written before
> >>> "gpadl->buffer".
> >>>
> >>> Cc: codemender-patching+linux@google.com
> >>> Assisted-by: LLM
> >>> Signed-off-by: Bill Wendling <morbo@google.com>
> >>> ---
> >>>    drivers/hv/channel.c   | 2 +-
> >>>    include/linux/hyperv.h | 2 +-
> >>>    2 files changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
> >>> index 7e4cc6f55237..7042de2dd481 100644
> >>> --- a/drivers/hv/channel.c
> >>> +++ b/drivers/hv/channel.c
> >>> @@ -548,8 +548,8 @@ static int __vmbus_establish_gpadl(struct vmbus_c=
hannel *channel,
> >>>     /* At this point, we received the gpadl created msg */
> >>>     gpadl->gpadl_handle =3D gpadlmsg->gpadl;
> >>> -   gpadl->buffer =3D kbuffer;
> >>>     gpadl->size =3D size;
> >>> +   gpadl->buffer =3D kbuffer;
> >>
> >> I think in some cases these subtle changes are worth a short but
> >> informative comment saying that the _counter_ must be initialized
> >> before the first reference to the pointer.
> >
> > But that's only for dereferencing it... there's no ordering requirement
>
> Ah yes, I got a bit carried away by the change itself.
>
> > here at all (and I think swapping order is needless churn). Neither
> > order is correct: only having them both set before dereferencing
> > "buffer" is required.
> Yes; maybe this is something the LLM should learn.
>
> Thanks
> -Gustavo

I've explicitly told the LLM exactly this, but it either forgets or
ignores it. *sigh*

-bw
