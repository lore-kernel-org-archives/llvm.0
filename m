Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B4D10E0
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 16:02:39 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id fd25so27631362edb.3
        for <llvm@lists.linux.dev>; Wed, 25 May 2022 09:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lb8jI+HgCwwCo9V7MBgxPMSbhS6L6pVhhain2dWQdfw=;
        b=SrcSxh5jk6TjzFY/hFo4GziSI+tKwhTA+Bvj+vAZBzjRzoe5Yq5yUQ8S6OgM7ow5UA
         I1rF2QLtzS87ewjkBnw11tZEocdxf3LdCJ+RmmexCCKPZsRw7wjUq4DXjoL498yjLWPZ
         rYUCkLMUhIDW61u3uDHvosCrwx9NoPonecdyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lb8jI+HgCwwCo9V7MBgxPMSbhS6L6pVhhain2dWQdfw=;
        b=emfnzvIssFn/mZK2H40F8zGwKvxzrb2CqjluwGH1DIBLJGJWkB0w16XImZuE3GugbN
         8SI1iKXYtseBLBXUpvLeUHkbCNkCP5MaS8qUCjkXeyGTP5WUT5qgPRcxeIQzxbPLQrNy
         Uj3c3SZdiAujIvNfex+cheTJtYv7sJJ0B1je/UVRHTizM2sMhmjlfXsR3WN4VHPWDf3b
         EP7KWUzIkRWV4tFlp3eExE0IuINIuJcj0wOe54JSkzmFqNYmLEDKKMmNqnJT99pPBHfa
         BPj3HbFHFcV1QDV1PHNiDmgDUS/WqlXa1l+t6SLW1wCzaElOsJJm+XJNdL3RljdpNk56
         2cdg==
X-Gm-Message-State: AOAM531Bz/N/3lLM+Xb4i+8D+EvjUo9cYVYby2mAxFGS+OpPyGVwrs4Z
	8oqfnQGf79mHz8okpo9/x8sdzwOMzLa/0F2b
X-Google-Smtp-Source: ABdhPJwzHsUortBVwp7l0FZCc778xjRZt82hCPUWpp0x2bnypXCWlrlCKEkYhTcFsCd3uxAGxWf3xg==
X-Received: by 2002:a05:6402:cae:b0:42a:ba8f:9d05 with SMTP id cn14-20020a0564020cae00b0042aba8f9d05mr35010427edb.277.1653494557991;
        Wed, 25 May 2022 09:02:37 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906c18600b006f3ef214e72sm2991024ejz.216.2022.05.25.09.02.36
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 09:02:36 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id t13so11568699wrg.9
        for <llvm@lists.linux.dev>; Wed, 25 May 2022 09:02:36 -0700 (PDT)
X-Received: by 2002:a5d:59ac:0:b0:20e:6fd6:88c1 with SMTP id
 p12-20020a5d59ac000000b0020e6fd688c1mr25406709wrr.442.1653494556145; Wed, 25
 May 2022 09:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220525144638.293934-1-helgaas@kernel.org>
In-Reply-To: <20220525144638.293934-1-helgaas@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 May 2022 09:02:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=whk=ygWsxt=1HhndCwjtXdga9sPmkxFGby5PJWRk5yx9Q@mail.gmail.com>
Message-ID: <CAHk-=whk=ygWsxt=1HhndCwjtXdga9sPmkxFGby5PJWRk5yx9Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "linux/types.h: remove unnecessary __bitwise__"
To: Bjorn Helgaas <helgaas@kernel.org>, Jiri Slaby <jirislaby@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>, llvm@lists.linux.dev, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 25, 2022 at 7:46 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> This reverts commit c724c866bb70cb8c607081a26823a1f0ebde4387.
>
> Jiri Slaby reported that c724c866bb70 ("linux/types.h: remove unnecessary
> __bitwise__") broke userspace, including open-iscsi, because it uses
> __bitwise__.
>
> Restore the __bitwise__ definition.

Hmm.

Presumably it's only the uapi case that actually wants to re-instate it.

And I'd rather make that "__bitwise__" case explicitly special, with a
comment about why it exists when the kernel itself doesn't use it.

IOW, rather than the revert, maybe something like the below
(whitespace-damaged) instead?

Jiri, does something like this work for you?

                 Linus

---
 include/uapi/linux/types.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/linux/types.h b/include/uapi/linux/types.h
index c4dc597f3dcf..308433be33c2 100644
--- a/include/uapi/linux/types.h
+++ b/include/uapi/linux/types.h
@@ -26,6 +26,9 @@
 #define __bitwise
 #endif

+/* The kernel doesn't use this legacy form, but user space does */
+#define __bitwise__ __bitwise
+
 typedef __u16 __bitwise __le16;
 typedef __u16 __bitwise __be16;
 typedef __u32 __bitwise __le32;
