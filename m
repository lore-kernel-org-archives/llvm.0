Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C39C72
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 17:23:03 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id b20so28665718lfv.3
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 10:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H8Db515P2u3wr8eXpxbK+mdL07rAEGHZYTKLOrQ0Ezw=;
        b=BLudoU1R5T/CW89tzCG/kuhg5sdEQS1uJDH9zxbhJO16UL5oDpz87cOexihq6kA0GQ
         sfvfHJEXVSEKxpc4dG6OIUZ+biW+n9i/NjdbEc4QgrozJY5506juVmjJfXLkX6ZD6fh9
         D3o7GNWJEvwNHDxhF694ejAjzK1CpMMUJxxDWz7MxszI5XZPKG7F9YhYU/jzaA3hIcvJ
         AFbLyOIkHHZfNuL+z1mlniTqeo5VhnJfGAye/bZlcP43dq8u0O+K5qj+QHJA4e60VGIb
         f5CBFez0yMwbHYeNzDgpiSzFFPM4+N58pVNaALuRu1BkxWOq5xqnJlLdkOzUsfCw+ryt
         ODgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H8Db515P2u3wr8eXpxbK+mdL07rAEGHZYTKLOrQ0Ezw=;
        b=Dr4Jcl0CINirZB+BG5w7dfph3kEK1Si7tAcCtVHVUDTMP6prNyk/vz1e/tC2V45VHu
         7VrW151MJfb+9TkVURsWSToTEi49Zqk3KqS+v1MCdbfrKbRvhFMIqO/bGviCMX2Bxer0
         eaiBkX7ZUeiV0wkA3SoaqefbprdMEjtRIkHGzW7MY1m6VGxw+bY14y4rYJnhCOKHFVSQ
         7BcR9KE/8qp/X6USHNiop7KexLEtazqaA/B8I2+Z6SGX1qDJfaCDQx+6CwhBHT5rwHsc
         mrnYNrAuLPbOMexC95MeIYTz3Cw38qX3U7sEkCxb1t5iMmfonqh9vvlbTGWHGpTrwHP0
         CnBA==
X-Gm-Message-State: AOAM531fEWhncD7wYlvm0PQBp2vcQmMiLy/8IhfB71ExKQJBawPR2Wh4
	ALjzXIoGRHpMVoDXiyjxFhNxk0owrQYSQfE9BowTsg==
X-Google-Smtp-Source: ABdhPJyvjrJEB0rRbVB9O+YguaIBi4LthEutwQhoaWse0IUnkg0n/FYjG3RqA3+pw+y/Sq3ipUz9tZwJgyVXblJ7cmQ=
X-Received: by 2002:a05:6512:110a:: with SMTP id l10mr393783lfg.550.1633022580476;
 Thu, 30 Sep 2021 10:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930162302.2344542-1-nathan@kernel.org> <CADnq5_PBMGdUG8VMUQ2UOSdd9qXbZ7QoyGH2RTgUPnTjdzKqFA@mail.gmail.com>
In-Reply-To: <CADnq5_PBMGdUG8VMUQ2UOSdd9qXbZ7QoyGH2RTgUPnTjdzKqFA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 30 Sep 2021 10:22:49 -0700
Message-ID: <CAKwvOdk56-7UQDs_EAn+WK397mnd5H7_JMrsjROPk5ZFCw2QLw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Return NULL instead of false in dcn201_acquire_idle_pipe_for_layer()
To: Alex Deucher <alexdeucher@gmail.com>, "Deucher, Alexander" <alexander.deucher@amd.com>, 
	"Koenig, Christian" <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 10:10 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Applied.  Thanks!
>
> Alex
>
> On Thu, Sep 30, 2021 at 12:23 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Clang warns:

Any chance AMDGPU folks can look into adding clang to the CI roster?
-- 
Thanks,
~Nick Desaulniers
