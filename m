Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552864400
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 16:29:40 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id r14-20020a17090a4dce00b001faa76931beso8569676pjl.1
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 09:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=lBvvh8CMBUZ2sjFkD26Cqoc4+9rLr06nz33vMiatlKg=;
        b=ryYpBjDwNxfxOBFtLjd3AdIO/kOW2kWcb+2pKWhn80Pe1op1mxwSp8CnITVdWJGt74
         AWmWNwDRMPmtMhrrKzQ9B+Nn0XttzRBXgkP0wifL2WQ9E7uHGomjTnFWFYJWvk3U7ubd
         XPUPV8VczITtcXntc4aIgnqWVSgttAI0YPo5NLhyXYPK+JC1SzJK9IGRwXEn/MYIJXnE
         U1gOkozuTys4MqFUqrW8FR3FinnNKG5k/69INT6LbiyQMBhBx/Z1/LnOwgBY3yvKH/TD
         oQ8rrX7D5kXlrqqjjljBNGIT8U03QL5AyKxxtWgh2wye6WsTvMaWPVWUyHbkv/KROuMH
         Pwrw==
X-Gm-Message-State: ACgBeo1ubu1oQ8iZkKQcjXIHALDt6KtDxasne0lCLo80BTZWaJEO3Pye
	JSTvs+Oyvgcpz9QmTfMpl1E=
X-Google-Smtp-Source: AA6agR7vd7jE0Y5Ib+TqvdaFovHQP0nydl+a10cj01d60/tG2Hj7/bbclaJKgdJa5dhuJjDKvnN5RQ==
X-Received: by 2002:a17:902:f650:b0:172:8ee1:7f40 with SMTP id m16-20020a170902f65000b001728ee17f40mr4444648plg.101.1661531379674;
        Fri, 26 Aug 2022 09:29:39 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:a12:b4b9:f1b3:ec63? ([2620:15c:211:201:a12:b4b9:f1b3:ec63])
        by smtp.gmail.com with ESMTPSA id x36-20020a17090a6c2700b001fa867105a3sm1939818pjj.4.2022.08.26.09.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 09:29:38 -0700 (PDT)
Message-ID: <5ffb520f-d86f-be3e-4239-2f31c681ede2@acm.org>
Date: Fri, 26 Aug 2022 09:29:36 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [syzbot] upstream boot error: BUG: unable to handle kernel paging
 request in blk_mq_map_swqueue
Content-Language: en-US
To: Aleksandr Nogikh <nogikh@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>,
 syzbot <syzbot+ea55456e1ff28ef7f9ff@syzkaller.appspotmail.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 'Aleksandr Nogikh' via syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <0000000000004c3b1405e6b7de26@google.com>
 <f70b1cf7-0291-6ebc-68f8-db9c68963255@acm.org>
 <CANp29Y7bgwDzd47E6h8gseYuu5YXF-ABRrhVXFXS-HF7PhF-Dw@mail.gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CANp29Y7bgwDzd47E6h8gseYuu5YXF-ABRrhVXFXS-HF7PhF-Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/22 06:15, Aleksandr Nogikh wrote:
> Syzbot would have included the USB mailing list and the USB
> maintainers if it saw that the bug might be related to this subsystem.
> The bot's guess was that it was the BLOCK LAYER subsystem, so it Cc'd
> only the general lists and linux-block@vger.kernel.org
> 
> Is there anything in this bug report that can reliably indicate that
> the bug has to do with USB? If there is, we can definitely adjust our
> guilty subsystem recognition logic.

Hi Aleksandr,
  I may have been to fast with my conclusion that the root cause is in 
the USB subsystem.

Regarding your question, can syzbot inspect the console log and scan for 
"scsi host%d: %s" strings? The text next to the colon comes from the 
SCSI host template "name" member and hence indicates which SCSI LLD 
driver is involved.

Thanks,

Bart.
