Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE06172
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 17:25:07 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id j12so2126415qvk.12
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 10:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d5B9e1Cyi0JhwKWEml7iuPih0nBAtWtEukFOrjjJnY0=;
        b=f+bvuZ6JlYfGopABNgCneINt/jqcD0o7QYvRv8DV5elz3c9CpVryuAwTSBzor5IdP0
         yzO406sYsOTmRhEZ6K8FKqiG3GHEYFNXG2WRO0K0emxr8BDPIKTwZ8LUD0Izc+mXjnNF
         uNpjwAJcMjqxKdzS9WlG5BW5l0O89Hz4uLBtruj2EM/+JiUbleA0HafQBBnfP8NPIjex
         LX7tx/O1dlIFeqVasAOrLsxirjiWkDtl7LjFmexe/HDzCaqEU369EIguu2ziUX3V/DUa
         zvTb8HPMrymg6vX9QTMAEijxGbYkG1MvIuXd3jWZztLB++3ODvGbn+hyjheGWwn4tUkg
         YiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d5B9e1Cyi0JhwKWEml7iuPih0nBAtWtEukFOrjjJnY0=;
        b=rNqlSfISiuqDUmarT7m6+jtL58khreVwRQI+QLsI4EfaiKVBSGjRcs3P1Rvddt1ltX
         rGk6tI/G7MowcMifKsEFTaybrFVpJUtUHh+L/ly3St2uu3dXcyOLFYmEO5K7VwAO3dT4
         v0cHUqYWU40JWMjolM6WjV+DrvT6CweCHGeVYPWljC/tYfDRI5dB3l4z6EOMbd19lbAo
         LowNJvIpMrolAflD4W7CDfyU4tMchQFMqkUzzT7AbwC2cN9ZvIUrDx+kPrwhxNILIKuH
         +8+f2+sz/hfxc2peGWfiHdzaBPsu+TpC+uBR0Y41MNBW7fDGR811PtokpKmip9TjRD84
         x74w==
X-Gm-Message-State: AOAM530a843L/VYJABOja6sOQ/o5pem5gzr3gzayOkbW/OhrA+BL1hLi
	8sC89FbBzXCciipFUjrN8plI5ikFi2yc+WPF4rkR0la4iEg=
X-Google-Smtp-Source: ABdhPJx6YyZ/+etdKFX6+ZvhxFnw3OJipzQgmPjSPysSm4HVGBCwTGzggnrRlwwt8VN2N9FOPBJimKbN6+UB7foi4Gs=
X-Received: by 2002:a0c:aac2:: with SMTP id g2mr202369qvb.41.1634145906145;
 Wed, 13 Oct 2021 10:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211012234606.91717-1-ndesaulniers@google.com> <20211012234606.91717-2-ndesaulniers@google.com>
In-Reply-To: <20211012234606.91717-2-ndesaulniers@google.com>
From: Christian Biesinger <cbiesinger@google.com>
Date: Wed, 13 Oct 2021 13:24:28 -0400
Message-ID: <CAPTJ0XEQn7W-2a3NPUZYt4Jr1nKCVVp2W-uKTfdiFEbiyuBQcQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: vdso32: drop the test for dmb ishld
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Simon Marchi <simon.marchi@polymtl.ca>
Content-Type: text/plain; charset="UTF-8"

Hi Nick,

On Tue, Oct 12, 2021 at 7:46 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Binutils added support for this instruction in commit
> e797f7e0b2bedc9328d4a9a0ebc63ca7a2dbbebc which shipped in 2.34 (just
> missing the 2.33 release) but was cherry-picked into 2.33 in commit

Shouldn't that be 2.24 and 2.23, respectively?

> 27a50d6755bae906bc73b4ec1a8b448467f0bea1. Thanks to Christian and Simon
> for helping me with the patch archaeology.
>
> According to Documentation/process/changes.rst, the minimum supported
> version of binutils is 2.33. Since all supported versions of GAS support

(I have not checked whether this version is correct or not.)

Christian
