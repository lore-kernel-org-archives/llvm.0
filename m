Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964A428E8
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 10:34:40 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-4bf16baa865so106624067b3.13
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 02:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4GG5MB79KA/+iG8tjCkehVlHp0lvZGYfV+k+DriA6GM=;
        b=oX+gSy8dlC3JT3sgpgfMdXgU2gGGk+/cSlhzGvhqU7ra+xAIuvX5gmlu1/2fEgc+Qs
         dtYI9fpso74sbJ8BJNg3nucfU0/xVki4WWgK8IMfVXJpOnf8L6IPKEA0nxhvyvw7c015
         NAJc42nRec+pyaDatOj3+yjuaI9BROcyPytE0icCWebHzsslmcFzNsl4nMySDtYXkgpF
         YJndiY0Fa6+NJ9R0T1JlexsmB+CzIckfFzx4r+AJ4aFXa72y+h9Ed1H4gMxg3qoV/xXI
         LbS1Kx2MHkp4h/6OEcF0+t1fJpC5hJESwvfI17CpcEPmbMRoRAQGMNLVPJIG3C7RvGIM
         eJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GG5MB79KA/+iG8tjCkehVlHp0lvZGYfV+k+DriA6GM=;
        b=7UDio2gk20nfwIuOtkjP5f+X+e/3gnCkJ7+fA7D9f+HlK4OnADsddluJz1GgDRBmhb
         rlGwG84JVmtGkXozEPEIZkL2K5Mp9WPZGZeTVJMiQNeyENvODr3oLjWXoe/qklnVsNIY
         H/spzwDKsKfpx6/lwXhGytfV/mwV+MOue9JUOCIQwQMyfFHbG1/WGv2tidvkrDHoLWBT
         zlWrcD7+HGK2kMx8xDhMOv9PIB5d+6j4NYo5MQzcE+rMWX2XCx45QB581E1GNZIvl5kC
         yWwvog0PisXbC8D8NhUJDSLTZeLp8Brwb6cBMggOOCgIX5C46C/EO6bhaWNtcwtQGlrQ
         zoIA==
X-Gm-Message-State: AFqh2kpI4pX9kXpA+Tz0xUk/ImDyVJvssYHTRti+T3WKgR4le+U0Tb7I
	M2OWw7KGUw0YzUa2kfFJw4K5ehbS6enIAduiRmH1Gg==
X-Google-Smtp-Source: AMrXdXvbJg8E9ccFMQ3aL0vvH8SnY7pE6BrEr6EVxZ6O7V2lb8vcdGHfRgcUFU55mvIl+ku9rprFK8ohzvLepTsurJU=
X-Received: by 2002:a05:690c:313:b0:37e:6806:a5f9 with SMTP id
 bg19-20020a05690c031300b0037e6806a5f9mr1578119ywb.47.1673260479291; Mon, 09
 Jan 2023 02:34:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230108143843.2987732-1-trix@redhat.com>
In-Reply-To: <20230108143843.2987732-1-trix@redhat.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 9 Jan 2023 11:34:28 +0100
Message-ID: <CANn89iLFtrQm-E5BRwgKFw4xRZiOOdWg-WTFi5eZsg7ycq2szg@mail.gmail.com>
Subject: Re: [PATCH] net: ena: initialize dim_sample
To: Tom Rix <trix@redhat.com>
Cc: shayagr@amazon.com, akiyano@amazon.com, darinzon@amazon.com, 
	ndagan@amazon.com, saeedb@amazon.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com, 
	khalasa@piap.pl, wsa+renesas@sang-engineering.com, yuancan@huawei.com, 
	tglx@linutronix.de, 42.hyeyoo@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 8, 2023 at 3:38 PM Tom Rix <trix@redhat.com> wrote:
>
> clang static analysis reports this problem
> drivers/net/ethernet/amazon/ena/ena_netdev.c:1821:2: warning: Passed-by-value struct
>   argument contains uninitialized data (e.g., field: 'comp_ctr') [core.CallAndMessage]
>         net_dim(&ena_napi->dim, dim_sample);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> net_dim can call dim_calc_stats() which uses the comp_ctr element,
> so it must be initialized.

This seems to be a dim_update_sample() problem really, when comp_ctr
has been added...

Your patch works, but we could avoid pre-initializing dim_sample in all callers,
then re-writing all but one field...

diff --git a/include/linux/dim.h b/include/linux/dim.h
index 6c5733981563eadf5f06c59c5dc97df961692b02..4604ced4517268ef8912cd8053ac8f4d2630f977
100644
--- a/include/linux/dim.h
+++ b/include/linux/dim.h
@@ -254,6 +254,7 @@ dim_update_sample(u16 event_ctr, u64 packets, u64
bytes, struct dim_sample *s)
        s->pkt_ctr   = packets;
        s->byte_ctr  = bytes;
        s->event_ctr = event_ctr;
+       s->comp_ctr  = 0;
 }

 /**
