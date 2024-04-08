Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC347E8
	for <llvm@lists.linux.dev>; Mon,  8 Apr 2024 22:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712613622; cv=none; b=tbQ/DUCL+4HRUZ4Tfoab7cz5hFppWE1WXq34RxNfune9wv+TaD2EgKYyei+O/A2d3RghJSjGMfVU1m7F9JbE7gGYXJkSpICr581vy9lQopdOjeE67IDNrsf/p+nKksiGuqzVO2yYXxc2Bit8fDjGCKMdkbHkxEnCzCbwzFJ/fAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712613622; c=relaxed/simple;
	bh=PWS489kmchIcHKmyqvVK6Tbd8mB/KG6l2if/1ML++m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bI3u6sByWNJbn7d6gaBNxn0E9Ql6OMgPAJz7RrsSBGDX3ZIsNvdqXlwj8N0ZtSAg1dyBRCxRoDt0Ravz3qfnrwKbr73YC85taJiohhMMdnOfaIjy5svjD0BKAz4dGcOaAbHLAZ3BRamzx4ou5WlekvJwogq2QsHMzMv07JzDtgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U0bQ+QJ6; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U0bQ+QJ6"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5aa2bd6f651so1346467eaf.0
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 15:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712613620; x=1713218420; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rM17DTMLvs+d4icBG3QadGPxpGJCsN26mJq8GhmBxnE=;
        b=U0bQ+QJ6pOO0tMr5j/JgpkZ4OZE/80aKpNJLqBKI6FyxlHuSRaUR+ItKQXvh/SHdqV
         RVqYNIkXvtBawQ9feVLhk7uS3bT+GJyXaJKlOEB24nrsabfXnSm/BxsN2UU/256/DD1T
         hWw7gXkSLlhc/au2Zw5KZaP+JTbCtMpW51D4tsYec3LAmHdHN9XmBDM6CCKBUiXM0x3W
         Wm505b80ctD+SskiGv8OtS683GUpFfj+nNhgOKsn3fOLAznH/sTKzUPpwMhhcC6SCMhZ
         6FCKe8FR3VqWRoW+6gpK67bo0xsCHRz6bTSvumrV/yATNtb0ZPIx0WI31ndyMjgED2uy
         PtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712613620; x=1713218420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rM17DTMLvs+d4icBG3QadGPxpGJCsN26mJq8GhmBxnE=;
        b=Telig7AE/hKG/7qKNvcluz/KkNuRro1XRHlTnnYOIJzxjOXWRAJab+M3hwFnevFZHB
         hU2GTNnqbGSk/VtLobSR1NR1WfgUpIvyYIMW/Pqe5D9pXhhWO4qhhTEKkla/AYHZiJCy
         /o4Nq5sIbqoPnyyWtWPCIY2zkPk0AuJbaMvQqvJAdFy/S+IsVAC5mbBwxDhrXohZZulX
         paLgZqobY3A5NYTHXdSe5KT6mh35Za0Ugm6oq7Uf0VEBFYndyLFlmeuu9oQbGuKahIcN
         RkNH+3a2dBpAJ+6Z9Z2mv/Ydk2IBNZfiJAtv+1o1352tXLWbFN/q83KxVmPmQhjyeNiT
         rUGA==
X-Forwarded-Encrypted: i=1; AJvYcCV0fZDby8TQRyFtNlLIvV3ks4938nqnbVO0GL3Ker56E5tnNg+IrC/uPjFW88B0AieJI5zQHjfi8NnzwnCTr2BfQ4LWxg==
X-Gm-Message-State: AOJu0YwVVEqdxuzGKAkuy646D8jmOSYyZ7bDeEQpSTHyjmWdKizC7W5q
	H/FjVkMBt0tjLxiV63QaTdo03cl+XPSc1QPmludYb3J/xjdqLqSRtq2xZvnzLg==
X-Google-Smtp-Source: AGHT+IFyicdHNmbgjMW/Eqm0AR4iX9UCHFCnTgbSuKVtXnnpb5cS2MCP9PCbwTgk3XP/y1KX76uoRg==
X-Received: by 2002:a05:6870:c087:b0:22e:9806:f97a with SMTP id c7-20020a056870c08700b0022e9806f97amr11596008oad.2.1712613619572;
        Mon, 08 Apr 2024 15:00:19 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com. [34.135.64.30])
        by smtp.gmail.com with ESMTPSA id n9-20020a056638264900b004829e8e9456sm414370jat.20.2024.04.08.15.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 15:00:18 -0700 (PDT)
Date: Mon, 8 Apr 2024 22:00:16 +0000
From: Justin Stitt <justinstitt@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH 0/4] Enable more warnings by default
Message-ID: <qroq7fzresogvlq4y5o5pl4p6brhij6gynum4iqrim3kfy35xk@sgv3rtuu3uot>
References: <20240404151713.3493098-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404151713.3493098-1-arnd@kernel.org>

Hi,

On Thu, Apr 04, 2024 at 05:16:53PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I think these can now get merged into linux-next. I reordered
> these slightly from my previous submission to skip the
> -Wcast-function-type-strict warnings but instead include the
> -Wformat-truncation enablement, based on what got merged so
> far.
> 
> We are still missing the "kallsyms: rework symbol lookup return codes"
> and "firmware: dmi-id: add a release callback function" patches, but
> I expect them to get merged through the respective trees soon.
> 
> There is still an open question about the order of patches in the
> coming merge window: if some of the other patches are also queued
> for 6.10 rather than 6.9, this series has to come after those to
> avoid regressions. Maybe they can go into some kind of 'kbuild/late'
> branch that gets merged in the second half of the merge window?
> 
>      Arnd
> 
> Link: https://lore.kernel.org/lkml/20240326223825.4084412-1-arnd@kernel.org/ 
> Link: https://lore.kernel.org/lkml/20240326144741.3094687-1-arnd@kernel.org/
> 
> Arnd Bergmann (4):
>   kbuild: turn on -Wextra by default
>   kbuild: remove redundant extra warning flags
>   kbuild: turn on -Wrestrict by default
>   kbuild: enable -Wformat-truncation on clang
> 
>  scripts/Makefile.extrawarn | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
> 
> -- 
> 2.39.2
> 

No warnings for me on Clang-18 with this series applied :)

Is there some kbuild documentation somewhere that should be
updated/created to reflect which warnings the kernel has enabled by
default?

Reviewed-by: Justin Stitt <justinstitt@google.com>

Thanks
Justin
