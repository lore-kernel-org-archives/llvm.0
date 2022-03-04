Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4567A
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 05:22:53 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 132so6589021pga.5
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 21:22:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OUz+YHeOX2526f3yLcPlYSdunuzlqb7mEsolHTN6QCc=;
        b=fSezXiRUdxW5vYP4Ht4ZpS1blu1+0Gw6AzApzTeDqTiBVxF5qZGQFmRK8VLTHQwz2d
         nZCqDRAkZYqnCByvNYGwmA5HG7H84LmlE1s9byqDhNMrSJyEQsMI63THwOFoTq7Sty+/
         eMUNhURks6FKOvrmu0D5LMWOz6WxmA/qnAflbSTP0R9XUXwtQZN5i3z8OTPd3iHFBteq
         CwtCEDNOyW9v/QiPmdZlElXNKxPboHR5gCCKba0IJ51EPbtxbH44x5qZWrp+46yPNhUv
         DBY4lIiiorb3lK2i0rPb0WjckH17SrM31/Y0TBPD2pkNzmG8xoHxg10nCzF6T0+iebh7
         K2KQ==
X-Gm-Message-State: AOAM533VoJ48T3K9kkGS+6lhnCdnXu6gyQJxPDM7rmL5FJn07srVRw8N
	QNAtmR4douuJ08NWS+E2LIk=
X-Google-Smtp-Source: ABdhPJxYq0TQM9vFcm1Kh6j0fbxqoFm/wrv7nZEyjEvofCbrP3HT13X6zNV9QhK/eSCtlBdJzomxHA==
X-Received: by 2002:a63:4c07:0:b0:374:a41b:62e1 with SMTP id z7-20020a634c07000000b00374a41b62e1mr32490448pga.541.1646371373021;
        Thu, 03 Mar 2022 21:22:53 -0800 (PST)
Received: from ?IPV6:2601:647:4000:d7:feaa:14ff:fe9d:6dbd? ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
        by smtp.gmail.com with ESMTPSA id s21-20020a056a00195500b004f65b15b3a0sm4274787pfk.8.2022.03.03.21.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 21:22:52 -0800 (PST)
Message-ID: <e7e99791-aade-55fd-ac75-71478699cbe0@acm.org>
Date: Thu, 3 Mar 2022 21:22:50 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
Content-Language: en-US
To: Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Finn Thain <fthain@linux-m68k.org>
Cc: Konrad Wilhelm Kleine <kkleine@redhat.com>, Tom Rix <trix@redhat.com>,
 kashyap.desai@broadcom.com, sumit.saxena@broadcom.com,
 shivasharan.srikanteshwara@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, megaraidlinux.pdl@broadcom.com,
 scsi <linux-scsi@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
References: <20220127151945.1244439-1-trix@redhat.com>
 <d26d4bd8-b5e1-f4d5-b563-9bc4dd384ff8@acm.org>
 <0adde369-3fd7-3608-594c-d199cce3c936@redhat.com>
 <e3ae392a16491b9ddeb1f0b2b74fdf05628b1996.camel@perches.com>
 <46441b86-1d19-5eb4-0013-db1c63a9b0a5@redhat.com>
 <8dd05afd-0bb9-c91b-6393-aff69f1363e1@redhat.com>
 <233660d0-1dee-7d80-1581-2e6845bf7689@linux-m68k.org>
 <CABRYuGk+1AGpvfkR7=LTCm+bN4kt55fwQnQXCjidSXWxuMWsiQ@mail.gmail.com>
 <95f5be1d-f5f3-478-5ccb-76556a41de78@linux-m68k.org>
 <CANiq72kOJh_rGg6cT+S833HYqwHnZJzZss8v+kQDcgz_cZUfBQ@mail.gmail.com>
 <7368bc3ea6dece01004c3e0c194abb0d26d4932b.camel@perches.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <7368bc3ea6dece01004c3e0c194abb0d26d4932b.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/3/22 15:38, Joe Perches wrote:
> One argument is that churn leads to difficulty in backporting
> fixes to older 'stable' versions.
> 
> I think the churn argument is overstated.

I'm often backporting patches to older kernels and I think the churn argument 
has not been emphasized enough. Backporting patches is a normal aspect of a 
product lifecycle since a kernel version is chosen when development of a 
product starts and bugfixes are cherry-picked from upstream selectively.

Thanks,

Bart.

