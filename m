Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772AD8F54
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 21:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680296636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUtpTfIhZLUJQRzvjQdCDBe9iqr/rmYVzQ4AMz2vCfE=;
	b=J4uh3W02asn8suAf+SujfVohG5j8CyZCgeaJ6VkTHhV4Ts/EjwuDn7bYwRzGFq50GClFmk
	nhrumIsR1WSpgLhZcPKHAH7gVa6K4zn4JZvzZZrhbxEWO8MxWCFF3bYyeFCIx8hg4QMF00
	0gkAdXNiJaqBOJ8pA7QHsvWy03zIg/U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-MegdJrYcPUu9p7IBrVIlWg-1; Fri, 31 Mar 2023 17:03:54 -0400
X-MC-Unique: MegdJrYcPUu9p7IBrVIlWg-1
Received: by mail-qv1-f70.google.com with SMTP id a10-20020a0ccdca000000b005d70160fbb0so10273513qvn.21
        for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 14:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680296634;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUtpTfIhZLUJQRzvjQdCDBe9iqr/rmYVzQ4AMz2vCfE=;
        b=ODV926XqFJgjaBf5ibJmVjkC3I2BVVB/Jly3Kuc0D1JelkaoeKI2hNeJRXMdap7G+6
         OYNS4bSHRdeZsM8M5sYoPPYAOCFpm2v/YTdDorl3hpL2mNdCZ1Gkho91Uax+s5kD9KnF
         3LHrcwX9TVEHQRHKlE3gZz45BgeoxGnVR8/QbxfWVzju7YwpENcIismF67K7VvrHx7M1
         V+0B9ISk1H0U3liAWWL4DAYyp5cIAwOCaNu+ZEwYwb7bCNVzHijdvwt9X+Kku7DKi7gx
         S61P5nREARuSElY7ipRe2UjTS3Wln1oUoLN+jUglbJ7ZnlOLAoln3PbfsS73Yji26s3t
         QDow==
X-Gm-Message-State: AAQBX9doZ/FIvtoAI/GTwQ4RmKco3EVPJOtPxwaZImehqyAUWFeG9ldb
	5QwH+ymjwFmNpHmnl556V/glR+UTDXBq6h5VsbmJKvV4UcmfK7Yk0oD4tbo/6OwtBRNbaxRPiC2
	Y1t0qATuRnIENbzGWhyoqW6OOwJNFGCXik9RUnPeg4fbHacIwwhDo1kfS18Kevt2yJqJG
X-Received: by 2002:a05:6214:23c8:b0:5c6:ab93:6112 with SMTP id hr8-20020a05621423c800b005c6ab936112mr41644758qvb.30.1680296634316;
        Fri, 31 Mar 2023 14:03:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZJNrNr28ojgFbGTSKPoyvzjJNzlkeUYYlq7VX0czWlVa+idoT5bjB8pmq4W/nFI4r3SgHHsw==
X-Received: by 2002:a05:6214:23c8:b0:5c6:ab93:6112 with SMTP id hr8-20020a05621423c800b005c6ab936112mr41644711qvb.30.1680296633897;
        Fri, 31 Mar 2023 14:03:53 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id nd13-20020a056214420d00b005dd8b9345absm847628qvb.67.2023.03.31.14.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 14:03:53 -0700 (PDT)
Subject: Re: [PATCH] scsi: message: fusion: remove unused timeleft variable
To: Bill Wendling <morbo@google.com>
Cc: sathya.prakash@broadcom.com, sreekanth.reddy@broadcom.com,
 suganath-prabu.subramani@broadcom.com, nathan@kernel.org,
 ndesaulniers@google.com, MPT-FusionLinux.pdl@broadcom.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230331162617.1858394-1-trix@redhat.com>
 <CAGG=3QUYibiR2FLkLWBzr-j9X9nXLJVvmi5WqF=WmRZfgW3tRw@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <0afb4c99-63d9-0d53-8dfc-1a07cc562764@redhat.com>
Date: Fri, 31 Mar 2023 14:03:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAGG=3QUYibiR2FLkLWBzr-j9X9nXLJVvmi5WqF=WmRZfgW3tRw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 3/31/23 12:40 PM, Bill Wendling wrote:
> On Fri, Mar 31, 2023 at 9:26 AM Tom Rix <trix@redhat.com> wrote:
>> clang with W=1 reports
>> drivers/message/fusion/mptsas.c:4796:17: error: variable
>>    'timeleft' set but not used [-Werror,-Wunused-but-set-variable]
>>          unsigned long    timeleft;
>>                           ^
>> This variable is not used so remove it.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/message/fusion/mptsas.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/message/fusion/mptsas.c b/drivers/message/fusion/mptsas.c
>> index 86f16f3ea478..d458665e2fc9 100644
>> --- a/drivers/message/fusion/mptsas.c
>> +++ b/drivers/message/fusion/mptsas.c
>> @@ -4793,7 +4793,6 @@ mptsas_issue_tm(MPT_ADAPTER *ioc, u8 type, u8 channel, u8 id, u64 lun,
>>          MPT_FRAME_HDR   *mf;
>>          SCSITaskMgmt_t  *pScsiTm;
>>          int              retval;
>> -       unsigned long    timeleft;
>>
>>          *issue_reset = 0;
>>          mf = mpt_get_msg_frame(mptsasDeviceResetCtx, ioc);
>> @@ -4829,8 +4828,6 @@ mptsas_issue_tm(MPT_ADAPTER *ioc, u8 type, u8 channel, u8 id, u64 lun,
>>          mpt_put_msg_frame_hi_pri(mptsasDeviceResetCtx, ioc, mf);
>>
>>          /* Now wait for the command to complete */
>> -       timeleft = wait_for_completion_timeout(&ioc->taskmgmt_cmds.done,
>> -           timeout*HZ);
> It looks bad to remove the call to wait_for_completion_timeout(). Is
> it truly not needed? If it's needed, the "timeleft" should be checked
> or a comment left to explain why it's not checked.

Yeah. this is a screw up on my part, sorry.

T

>
> -bw
>
>>          if (!(ioc->taskmgmt_cmds.status & MPT_MGMT_STATUS_COMMAND_GOOD)) {
>>                  retval = -1; /* return failure */
>>                  dtmprintk(ioc, printk(MYIOC_s_ERR_FMT
>> --
>> 2.27.0
>>
>>

