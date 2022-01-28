Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8DB2CA2
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 17:42:05 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id e16so5802853pgn.4
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 09:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PesQloUaxvEmTVPfJQcjOIXm9PVWBcnSQjPoitUS3nY=;
        b=wVWO83d8X0Ft5BVEPFszw90kBGQtlDI+m2F0f93Ckrv30MRBmSPCPQw8xzEufz4u3U
         z8ACCa72Y3FZ5Mda+cSgHBXZJfuVQ+gb40Lwtv1/9JKu1RXpzGIR66x+AYdC3ucZZpso
         Lpplt8moRRqDnJNJJzNUiGVYaH3FnH3iwk2YxmgXhbCNRZfQnTBiy1L0DBdjAuu9Syyu
         BExdMqq4JW7RSo81p82umdxKidGJNybkxoyc+LuukhVoF7MQ+uCVR0NRy5ldImU7P5Wi
         GxOGXLa8fv14aABMvnX5sEEZoaBxDLeP2uPZrNLrgdi6dVaDMheLb20ilhXCIbbw3Lo6
         4OJQ==
X-Gm-Message-State: AOAM530+d01E26I1c8R+4oeStzVmjZ0/1KI9kKTkMrfCEh5OzBAJ+HOy
	+zn1hYcryjVyj3JLAV6A+vg=
X-Google-Smtp-Source: ABdhPJzMLWm8Yz2uo2wdeHC5HjiecMlFM4aw3Bp/FY8+WB3loHfG+lRatSAgH3e6dnaxBBDKBabbxw==
X-Received: by 2002:a63:e94e:: with SMTP id q14mr7390897pgj.376.1643391725033;
        Fri, 28 Jan 2022 09:42:05 -0800 (PST)
Received: from ?IPV6:2601:647:4000:d7:feaa:14ff:fe9d:6dbd? ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
        by smtp.gmail.com with ESMTPSA id h18sm10275011pfh.51.2022.01.28.09.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 09:42:04 -0800 (PST)
Message-ID: <d26d4bd8-b5e1-f4d5-b563-9bc4dd384ff8@acm.org>
Date: Fri, 28 Jan 2022 09:42:02 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
Content-Language: en-US
To: trix@redhat.com, kashyap.desai@broadcom.com, sumit.saxena@broadcom.com,
 shivasharan.srikanteshwara@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, nathan@kernel.org, ndesaulniers@google.com
Cc: megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220127151945.1244439-1-trix@redhat.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220127151945.1244439-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/27/22 07:19, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> checkpatch reports several hundred formatting errors.
> Run these files through clang-format and knock off
> some of them.

Isn't this the kind of patches that carries more risk than value? 
Additionally, this patch conflicts with a patch series that I plan to 
post soon.

Thanks,

Bart.
