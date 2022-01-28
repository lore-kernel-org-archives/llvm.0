Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EC72C9D
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 00:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643329962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxwT0p8jQCZb+gDYDDAwQr1KnfSYAuazHgIfPZ6mp0Y=;
	b=bYZTMqReYLcs2dCuD5EalOTxEeYoMF7K9w3rUraLfFjdd3wq/WT0CC3BPk65sRH3DdiGZb
	Jz70cKjH3o3uZdccPb1PlTq7lZ3xJrBxBF3RsUzgVtMI9Bx1yqj4C+El8HfWhK1SrDqyOM
	sQ9ZD0tjzdOMOBiIcMmivBzQKt/hsEQ=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-6sZg69z3MFWtBdEyKWgBCg-1; Thu, 27 Jan 2022 19:32:41 -0500
X-MC-Unique: 6sZg69z3MFWtBdEyKWgBCg-1
Received: by mail-ot1-f72.google.com with SMTP id l1-20020a9d7341000000b0059c2046f9edso1753628otk.3
        for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 16:32:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QxwT0p8jQCZb+gDYDDAwQr1KnfSYAuazHgIfPZ6mp0Y=;
        b=TxYZPP8Lk01Ljl12nKYNfOoltHwB+6Gz/01EbMlA8YlNwfSBHFF5Qo4n5m7C4c7CeC
         /xaeY+13pYHc8n8QvZlMpMkwC2ljQ8OZDUM/8GWBWmk4Ztt9GPAcXvyekoGqoncCwi6/
         jkVfG/y6/0EBELrvozuS4gjZefJi+22MxX6vadOl9a/Y7Di28mAWeHVaig3bpNvMlq45
         YWInj0dARSHAlWjPfGsJ4TjJIZYSeEidPQ/lboChAYotgXNBeBE2kgsA7SSeoxYsdThS
         gApyghN6antRnu6XBoH8R11EheKaFBfl/pn+RmakEO6D3SipyefbKOpQD/9+AslGEIlW
         RUDg==
X-Gm-Message-State: AOAM530+/VHL7bf1IvG72QKedp5WG4lGWBIkcCw7KXRgM5rfQZjzfhLm
	s5KzH3aIptljHRHdKyu+d1upEnQQjNgxafP0h3VBlq/xI29iBSqp7Ujsr3kEBWU2nbl3qnXd90W
	N1XD61HvX7juM1g==
X-Received: by 2002:a4a:b787:: with SMTP id a7mr3106250oop.85.1643329960831;
        Thu, 27 Jan 2022 16:32:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwF4iZ8xzJp9ZMKoGlSFxuWfDOTK7MBV3+iSOO5oBeoOMi/8a1yzMEOflCdZN68H6r2hM3ikw==
X-Received: by 2002:a4a:b787:: with SMTP id a7mr3106237oop.85.1643329960607;
        Thu, 27 Jan 2022 16:32:40 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id o22sm9333917oor.34.2022.01.27.16.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 16:32:40 -0800 (PST)
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
To: Nick Desaulniers <ndesaulniers@google.com>,
 Finn Thain <fthain@linux-m68k.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: kashyap.desai@broadcom.com, sumit.saxena@broadcom.com,
 shivasharan.srikanteshwara@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, nathan@kernel.org,
 megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Joe Perches <joe@perches.com>
References: <20220127151945.1244439-1-trix@redhat.com>
 <953eb015-4b78-f7b-5dc1-6491c6bf27e@linux-m68k.org>
 <CAKwvOdnWHVV+3s8SO=Q8FfZ7hVekRVDL5q+7CwAk_z44xaex8w@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <fb308f51-f16b-3d9b-80c2-180940236b00@redhat.com>
Date: Thu, 27 Jan 2022 16:32:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnWHVV+3s8SO=Q8FfZ7hVekRVDL5q+7CwAk_z44xaex8w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 1/27/22 2:47 PM, Nick Desaulniers wrote:
> + Miguel (the clang-format maintainer), Joe (checkpatch maintainer)
> These criticisms are worth reviewing.
>
> On Thu, Jan 27, 2022 at 2:38 PM Finn Thain <fthain@linux-m68k.org> wrote:
>>
>> On Thu, 27 Jan 2022, trix@redhat.com wrote:
>>
>>> From: Tom Rix <trix@redhat.com>
>>>
>>> checkpatch reports several hundred formatting errors. Run these files
>>> through clang-format and knock off some of them.
>>>
>> That method seems like a good recipe for endless churn unless checkpatch
>> and clang-format really agree about these style rules.
>>
>> Why use checkpatch to assess code style, if we could simply diff the
>> existing source with the output from clang-format... but it seems that
>> clang-format harms readability, makes indentation errors and uses
>> inconsistent style rules. Some examples:

Problems with clang-format should be fixed, I'll take a look.

I was reviewing this file for another issue and could not get past how 
horredously bad it was and really did not want to manually fix the 400+ 
formatting errors.  I will drop this patch and use the use these files 
to verify the .clang-format .

Tom

>>
>>>   static unsigned short int max_sectors_per_io = MAX_SECTORS_PER_IO;
>>>   module_param(max_sectors_per_io, ushort, 0);
>>> -MODULE_PARM_DESC(max_sectors_per_io, "Maximum number of sectors per I/O request (default=MAX_SECTORS_PER_IO=128)");
>>> -
>>> +MODULE_PARM_DESC(
>>> +     max_sectors_per_io,
>>> +     "Maximum number of sectors per I/O request (default=MAX_SECTORS_PER_IO=128)");
>>>
>>>   static unsigned short int max_mbox_busy_wait = MBOX_BUSY_WAIT;
>>>   module_param(max_mbox_busy_wait, ushort, 0);
>>> -MODULE_PARM_DESC(max_mbox_busy_wait, "Maximum wait for mailbox in microseconds if busy (default=MBOX_BUSY_WAIT=10)");
>>> +MODULE_PARM_DESC(
>>> +     max_mbox_busy_wait,
>>> +     "Maximum wait for mailbox in microseconds if busy (default=MBOX_BUSY_WAIT=10)");
>>>
>> This code is longer for no real improvement.
>>
>>>   /*
>>>    * The File Operations structure for the serial/ioctl interface of the driver
>>>    */
>>>   static const struct file_operations megadev_fops = {
>>> -     .owner          = THIS_MODULE,
>>> -     .unlocked_ioctl = megadev_unlocked_ioctl,
>>> -     .open           = megadev_open,
>>> -     .llseek         = noop_llseek,
>>> +     .owner = THIS_MODULE,
>>> +     .unlocked_ioctl = megadev_unlocked_ioctl,
>>> +     .open = megadev_open,
>>> +     .llseek = noop_llseek,
>>>   };
>>>
>>>   /*
>> Readability loss.
>>
>>> -             prod_info_dma_handle = dma_map_single(&adapter->dev->dev,
>>> -                                                   (void *)&adapter->product_info,
>>> -                                                   sizeof(mega_product_info),
>>> -                                                   DMA_FROM_DEVICE);
>>> +             prod_info_dma_handle = dma_map_single(
>>> +                     &adapter->dev->dev, (void *)&adapter->product_info,
>>> +                     sizeof(mega_product_info), DMA_FROM_DEVICE);
>>>
>> Note the orphaned first parameter and odd indentation.
>>
>>>   static DEF_SCSI_QCMD(megaraid_queue)
>>>
>>> -/**
>>> +     /**
>>>    * mega_allocate_scb()
>>>    * @adapter: pointer to our soft state
>>>    * @cmd: scsi command from the mid-layer
>> Indentation error.
>>
>>> @@ -418,15 +409,14 @@ static DEF_SCSI_QCMD(megaraid_queue)
>>>    * Allocate a SCB structure. This is the central structure for controller
>>>    * commands.
>>>    */
>>> -static inline scb_t *
>>> -mega_allocate_scb(adapter_t *adapter, struct scsi_cmnd *cmd)
>>> +     static inline scb_t *mega_allocate_scb(adapter_t *adapter,
>>> +                                            struct scsi_cmnd *cmd)
>>>   {
>>>        struct list_head *head = &adapter->free_list;
>> Same.
>>
>>> @@ -586,26 +568,25 @@ mega_build_cmd(adapter_t *adapter, struct scsi_cmnd *cmd, int *busy)
>>>
>>>                ldrv_num = mega_get_ldrv_num(adapter, cmd, channel);
>>>
>>> -
>>>                max_ldrv_num = (adapter->flag & BOARD_40LD) ?
>>> -                     MAX_LOGICAL_DRIVES_40LD : MAX_LOGICAL_DRIVES_8LD;
>>> +                                    MAX_LOGICAL_DRIVES_40LD :
>>> +                                          MAX_LOGICAL_DRIVES_8LD;
>>>
>> Churn, if not readability loss. Note the indentation change here is
>> inconsistent with the indentation change noted above.
>>
>>>                         * 6-byte READ(0x08) or WRITE(0x0A) cdb
>>>                         */
>>> -                     if( cmd->cmd_len == 6 ) {
>>> -                             mbox->m_out.numsectors = (u32) cmd->cmnd[4];
>>> -                             mbox->m_out.lba =
>>> -                                     ((u32)cmd->cmnd[1] << 16) |
>>> -                                     ((u32)cmd->cmnd[2] << 8) |
>>> -                                     (u32)cmd->cmnd[3];
>>> +                     if (cmd->cmd_len == 6) {
>>> +                             mbox->m_out.numsectors = (u32)cmd->cmnd[4];
>>> +                             mbox->m_out.lba = ((u32)cmd->cmnd[1] << 16) |
>>> +                                               ((u32)cmd->cmnd[2] << 8) |
>>> +                                               (u32)cmd->cmnd[3];
>>>
>>>                                mbox->m_out.lba &= 0x1FFFFF;
>>>
>> Here, the orphaned term is moved up, next to the =. And yet,
>>
>>>                        /* Calculate Scatter-Gather info */
>>> -                     mbox->m_out.numsgelements = mega_build_sglist(adapter, scb,
>>> -                                     (u32 *)&mbox->m_out.xferaddr, &seg);
>>> +                     mbox->m_out.numsgelements =
>>> +                             mega_build_sglist(adapter, scb,
>>> +                                               (u32 *)&mbox->m_out.xferaddr,
>>> +                                               &seg);
>>>
>>>                        return scb;
>>>
>> ... here the first term is moved down and orphaned, which is another
>> inconsistency.
>
>

