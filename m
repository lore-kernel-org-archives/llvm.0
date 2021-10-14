Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320ED2C80
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 18:06:50 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id z11so29347397lfj.4
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 11:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nsRlgBJbQTA7BY0Fnmwq5m4pEEvG0cBSI6R143Kt50g=;
        b=WHV2vCMXGD6ZEvIfni8By8V/L+NEVj2+siSM5i6u+m+m4A17VkxISTcczENL7HggIW
         TsQGqR/AEE81Vj7fIIUQEtBL8pqP9Ix0GDfdKtzZ8o1/bQe0eD1VLhGODIpw2Jq4hNax
         Q8Bvf1oqUvYqc5igH+QmEvrzuqFfdGsS0B0qJRgXZA9YD81Ci1am6yNTzRop5IcA8498
         ohgRnARPE0aZDMYbAyiD0Dg84i3YCw1jEVx3eGvaOjRQHbQtP1uvn12BQ6ngMqBruA0p
         wr++gQ/NF+pYW4KMY+M0Vx3qXUgmvERGya7NWl1VwPlYukhdz62g5fmNj20IpFQtlWoR
         BQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nsRlgBJbQTA7BY0Fnmwq5m4pEEvG0cBSI6R143Kt50g=;
        b=fZro6k3x9VJUn6Ol5640qltqMoezoByHt6nJCp2Php3P+YZrhTgYjVSkVH/kS0MbHk
         95tz4AwY4gYiiRcZEjUZoK/OL2FsHoyDO0bppS0LJXe3UCJ1gtaRKUYXWcsfkl41Ea8s
         k87zNRNgYuDet1iF480YgzJdFnbMoHro7Fu35svQTmxuNJSK82GMWhvMo8vQtOxbuXLZ
         +PZPy4vnpBF19N4O0ARSkkYwzAEdmwcqIlUwpG4NkozgjOUOBxvIOYnSRtJsTbeJE1kY
         i0s3nK7ukZXP83Jwlzl8hd/ADwKSfIWkJorf2/d1T8yyyNGgjmg474u9doS+0L14yF36
         rpJA==
X-Gm-Message-State: AOAM530u4fY3P5sZK82/NCbk1g3XzV1tY7pLvFgBxysJ5kgQd4/g3ZVK
	T6aBGs/BMfgFYPfKRDxkvTJOkQbg2nA5tiIZGEpn85ofkgg=
X-Google-Smtp-Source: ABdhPJwETpROOF2rrrefiOfmhu3BX0ABuQ/67vQm8aEmvHnaIzANh2CeoTXlhoqCmEo5ip5J+Zo0EKES+Y5LLFtNL+I=
X-Received: by 2002:a05:6512:b0c:: with SMTP id w12mr6667968lfu.240.1634234807558;
 Thu, 14 Oct 2021 11:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211014150610.GA22151@kernel.org>
In-Reply-To: <20211014150610.GA22151@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Oct 2021 11:06:36 -0700
Message-ID: <CAKwvOdmHPR-9wB-aD-8P=w74W7RKfvOL-VcDVy=8TWHGb_brfw@mail.gmail.com>
Subject: Re: [PATCH] Compiler Attributes: remove GCC 5.1 mention
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 8:06 AM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> GCC 5.1 is now the minimum version.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  include/linux/compiler_attributes.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index e6ec63403965..87d1e773400c 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -104,7 +104,6 @@
>  #define __deprecated
>
>  /*
> - * Optional: only supported since gcc >= 5.1
>   * Optional: not supported by clang
>   * Optional: not supported by icc
>   *
> --
> 2.33.1
>


-- 
Thanks,
~Nick Desaulniers
