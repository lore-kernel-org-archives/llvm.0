Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F232C85
	for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 17:44:31 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id h27so17233903ila.5
        for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uSdR0ukf9MlQw9KUu/xtTk/HmpUv660FPwNY/MfGT4o=;
        b=hdFDeDsMdZPC3CyXZupqyaqcQ5EjCtOPqYNwZnwX2knJhX/sWq6/az7oIIDrEBrV/O
         59Apb8EHMcg9E/9F0lGwZ/5JcqbintrbhXJNJZzxO4+aLiwZNPRBj8epO9RpNDQmuiKy
         3myuj3JIHUcKvURcFQZKWyR3Dq+wOYMDODjXia9WpAQyrOH2wY3ZGzKR8k+S+zWTbIWl
         aGjfbpYz0doWKKoR0WMYqHcOIrs7dVhC236M+9c/4oeVXrLA7pK1wLIPzqet/7TY8ZlS
         qm1BY90M4jkJjwmVGXR+LqHDk+K6fGQKeOHp8At0UW6fYQ/a1cC9M0n1v/TM6UpsiSk/
         dvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uSdR0ukf9MlQw9KUu/xtTk/HmpUv660FPwNY/MfGT4o=;
        b=qjq59gRZg83mKk741PQgLQAyOsxE1vJoXvfG9IkBLDWLX6eXq5yN/fWwPfHMO5tOY+
         Vn6t2bDcu2zVyTX4u7hhwB+eSbQg/3T0nuQea5Cq9xdjQx22GfThh+LE4QX3m7oC5C1E
         fYnIWw7g72iveoH8DSzAvX31PqfGaS4nooUaB4mKwqKLM/ziSzWVRrpcWcOI4sDVH/Cl
         BCpIOgk1us4wgkiR05D5Mvkk9wwo6QzjxCV45gvNy9PuqiMAlo2eakL9DpHBveHQssVb
         yktkxQO4E8iI3l6D2+04FS8po+Wb2Wxb7xP6MZ2cmMhqlG7Q5qp7Ke9e5VCSaVQRgw5p
         35Ig==
X-Gm-Message-State: AOAM530+gyvYiwlUtNNHRHHuGKRhOdiFkIGx/UNU9TZaXbGgCQhL3bNd
	3+V0CP8OITW4Wcj4Z3KbUPC+4qAEwu5ecF4H/Z8=
X-Google-Smtp-Source: ABdhPJzLXc+w8dZc7PkAAF2DvdK8GG3MKotQo258y6c5dZJtGp1ELkFyLeJXvfxvmuELWtwQ/2tPWq2LzglvyuhuLw8=
X-Received: by 2002:a05:6e02:1688:: with SMTP id f8mr362093ila.72.1634751870235;
 Wed, 20 Oct 2021 10:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211020173554.38122-1-keescook@chromium.org> <20211020173554.38122-2-keescook@chromium.org>
In-Reply-To: <20211020173554.38122-2-keescook@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 20 Oct 2021 19:44:19 +0200
Message-ID: <CANiq72kCQa7_3JkUqO2=mdj+P2zcjPYJUai0oip5DN7Aaq_ySQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gcc-plugins: Explicitly document purpose and
 deprecation schedule
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	linux-security-module <linux-security-module@vger.kernel.org>, llvm@lists.linux.dev, 
	Dan Li <ashimida@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 20, 2021 at 7:35 PM Kees Cook <keescook@chromium.org> wrote:
>
> +Purpose
> +=======

Sounds good to me.

>  config GCC_PLUGIN_SANCOV
>         bool
> +       # Plugin can be removed once the kernel only supports GCC 6.1.0+

Since we are just giving the major in the other cases below, I would
just say GCC 6+ here (the numbering scheme changed in GCC 5 already).

Thanks for adding the versions, by the way -- this is useful long-term
and not always done for other things...

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
