Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED443173
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 10:23:00 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id w16so51481230edc.11
        for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 02:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M0nrXkjvT8Y2JTsBxE15ySAcNK2QPiRrQi7yxt+5z/k=;
        b=bZfdedTaBlISxsnA+HjOnZ2STTnliWILpWqzvyQ6qQWMHBDbqJEEzOrRd7Z209N+wV
         Pt7u7gf1aCvV8qAsRsq66SlB7ZDSM81mOI0eXQscqDfQv76/Retg+8ieV2cdXTVCUNjb
         g4vH1O+eIUoj+skY/jI67sxujc+a9xhj6NpSqTtbfLNAVq+qdFEeEDKW3F6/f4alCMU8
         8L29OhGE3C74CBXs0JFnCg3y8HxUbE/DzEziHguagP7ZjFEC8l2IaEP/MmuLunKjutas
         4ep7CN06F9nNM9u7F+wgRgi2rt+tZT+31rYGvYIdT1lKg5Mp1aohyE5cQW58dtnP3Qos
         qAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M0nrXkjvT8Y2JTsBxE15ySAcNK2QPiRrQi7yxt+5z/k=;
        b=Wv17GA8L/YkRI+nPASD0yKg8bsok7VIAPZ0fEnhN0OYVEZeKlxkNwgwttMu1qmhzAm
         b2rjWg14guz3eEWdjtGGcY3T64QKEITy6yRKe5cwdGuuPA/OXo5dBfAOwMi+UNevPHzd
         c+Qgcfi4z0nAuQ4uKtWTs832uTXMKOys3liTgIKDWfwP0M/SV/0CynpaOOmXwVqbAYql
         a9+VcIUHkGiPe8sOf2Z42NXDOwSWx+eeZA5NPjtQxuQPaVGmYsGlNX5EYAgM8gqtQDk5
         pZiJIK7oLvKdr33dfD5rNidg7tG+mzBg+Ox46QNLMSGK0WgnO413LGGBs13FFzxk2cCJ
         AYRw==
X-Gm-Message-State: AOAM530BoXet6rZ50hbPt0wn5iasdE0sFRuQ+VHHz6uJdE+dXSo7WdQp
	1klJ51DWS8lgQAHde7Gy1WrCZ3DCpejrwX5E9J8=
X-Google-Smtp-Source: ABdhPJwECqRHbXYE3+1gJLeWik7SnLbktBiu0AZzxvMVObvaegtHQCjFwf0DmV1UNgLl9J6yU9U5sFqr0U6pNjyMLGM=
X-Received: by 2002:a17:907:97cd:: with SMTP id js13mr57649438ejc.497.1641810179272;
 Mon, 10 Jan 2022 02:22:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220108140756.3985487-1-trix@redhat.com> <CAHp75VfbSmgeyi=8q1_he7mpGrNxYAOewKYWD=h8BSuxz2XWOw@mail.gmail.com>
 <0c0926d9-9b72-1519-7e22-e90ffc229940@redhat.com>
In-Reply-To: <0c0926d9-9b72-1519-7e22-e90ffc229940@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Jan 2022 12:21:11 +0200
Message-ID: <CAHp75VdJOzYR0HsZ2LWn-iAMwcM3s0NNDKQdXZZudcEB9RwE9A@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: cs35l41: fix double free in cs35l41_hda_probe()
To: Tom Rix <trix@redhat.com>
Cc: "james.schulman@cirrus.com" <james.schulman@cirrus.com>, 
	"david.rhodes@cirrus.com" <david.rhodes@cirrus.com>, 
	"tanureal@opensource.cirrus.com" <tanureal@opensource.cirrus.com>, "perex@perex.cz" <perex@perex.cz>, 
	"tiwai@suse.com" <tiwai@suse.com>, "nathan@kernel.org" <nathan@kernel.org>, 
	"ndesaulniers@google.com" <ndesaulniers@google.com>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 2:37 AM Tom Rix <trix@redhat.com> wrote:
> On 1/9/22 2:33 PM, Andy Shevchenko wrote:
> On Saturday, January 8, 2022, <trix@redhat.com> wrote:

...

>> +       if (unlikely(ret)) {
>
> This is double weird. First of all, wtf unlikely is here? Second, I commented on the patch that does something with this driver and pointed out to the return 0 in some cases. This one seems a band aid.
>
> Unlikely to have an error.

We don't use likely() and unlikely() here and there, you need to
provide a very good justification of its use.

For the record, I forwarded you my review against the code where you
can find much more issues with it that are subject to fix / amend.

-- 
With Best Regards,
Andy Shevchenko
