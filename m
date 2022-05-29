Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF98E7B
	for <llvm@lists.linux.dev>; Sun, 29 May 2022 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653828759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1IDqdGLArfr4gn5KVVbwW1OeNRwMY+hK8QbzyH+wdCw=;
	b=h9i5gHJsYkCgAyN11cy0M+mntLK8gFL9DWHgIFxG9+zwrOqJ2Qu6IXnPl9fBU5QGcznNKs
	wJ9mE8Z+bQzfv6gDMo9JB3HF1ZYoAdCBdNkVVpDehbCPqPDwlW+qt2KGQMzeH+KfOeONbx
	nPXUENQDAVFydbc6DbcPUK6jog31Lu4=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-L5dZBv7BP7uY-1q2Cgj1lA-1; Sun, 29 May 2022 08:52:38 -0400
X-MC-Unique: L5dZBv7BP7uY-1q2Cgj1lA-1
Received: by mail-oo1-f71.google.com with SMTP id c78-20020a4a4f51000000b0040e703b7626so5087578oob.1
        for <llvm@lists.linux.dev>; Sun, 29 May 2022 05:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1IDqdGLArfr4gn5KVVbwW1OeNRwMY+hK8QbzyH+wdCw=;
        b=iinEXK8vW97q1TPROUnctQZrneEPKqSj5t6n9Dbw6qbvHmfGF5dhvjcZlFv7TPUgPi
         Yq7z5te9QIVxUzwJQPKCAqDgWLAk2La+Y3x4dMT0KrzcRzMifbzTxNQGbr+9J/QqaTD6
         T3JwBa7eWA5BEFAJMHN+N04XAv0fFFb5FTvNqCERd3Xf413jSkLNZBzztOyU/ejwshV5
         3K5zWj1Qy4cYCDmowQMBr0QsVbHyZush0QBDnPn4sJ0KVM4xxnlN6GO1zd6EJar1tYQm
         bjbdtq/yc+6IUzDQqnOxNGxW4IdTt7QdW+i4GqAo2vOTiTGyTcRrniT58kdYJNnM7F7N
         h7bQ==
X-Gm-Message-State: AOAM533Bmdhv4M9bUuP7PXv+JHGJoKsujqAoTUQyldDXUpnznDJOcOy9
	+myXzSnwKxWoAovyHVaUpkV8sbetQGzPrIQoi8Qjd2Nio+W9sxyd3KM5t0WaUddaG3fSMJd2P9k
	yr4Jb377QiSgs5g==
X-Received: by 2002:a05:6830:3492:b0:60b:1dda:c407 with SMTP id c18-20020a056830349200b0060b1ddac407mr11626811otu.17.1653828756737;
        Sun, 29 May 2022 05:52:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCrjXqLqBiMZ7iKG+Mpk3oYrazd+9A6Gf21KYZyX+2mnWUSmy3fnZV9nCvr1+yHWi5tQMvmg==
X-Received: by 2002:a05:6830:3492:b0:60b:1dda:c407 with SMTP id c18-20020a056830349200b0060b1ddac407mr11626799otu.17.1653828756529;
        Sun, 29 May 2022 05:52:36 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id ny8-20020a056870be0800b000f303e9538csm1834556oab.30.2022.05.29.05.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 May 2022 05:52:35 -0700 (PDT)
Subject: Re: [PATCH] cifs: set length when cifs_copy_pages_to_iter is
 successful
To: Steve French <smfrench@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Steve French <stfrench@microsoft.com>,
 Nathan Chancellor <nathan@kernel.org>, David Howells <dhowells@redhat.com>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Steve French <sfrench@samba.org>
References: <20220526140226.2648689-1-trix@redhat.com>
 <CAKwvOdmPZXiMZRKyMfZVMmw-95XVocSZn3VVi3yJh0Bx1ONbJQ@mail.gmail.com>
 <CAH2r5mumSyxP8XUJjKwv9exh__NkCtG2HSiO-USqGo_7ZTb0yQ@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <3144155d-47c7-ccfd-ff52-e3fa4e0468ee@redhat.com>
Date: Sun, 29 May 2022 05:52:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAH2r5mumSyxP8XUJjKwv9exh__NkCtG2HSiO-USqGo_7ZTb0yQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/28/22 4:31 PM, Steve French wrote:
> Presumably this was in Dave Howell's patch set which we took out of
> for-next to restructure in some of Al's feedback and some things found
> during testing. So nothing to fix in current mainline or for-next ...
> right?

Yup. Nothing to fix.

So drop this patch.

Tom

>
> On Sat, May 28, 2022 at 3:40 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>> + Steve's @microsoft.com email addr.
>>
>> On Thu, May 26, 2022 at 7:02 AM Tom Rix <trix@redhat.com> wrote:
>>> clang build fails with
>>> fs/cifs/smb2ops.c:4984:7: error: variable 'length' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>>>    if (rdata->result != 0) {
>>>        ^~~~~~~~~~~~~~~~~~
>>>
>>> handle_read_data() returns the number of bytes handled by setting the length variable.
>>> This only happens in the copy_to_iter() branch, it needs to also happen in the
>>> cifs_copy_pages_to_iter() branch.  When cifs_copy_pages_to_iter() is successful,
>>> its parameter data_len is how many bytes were handled, so set length to data_len.
>>>
>>> Fixes: 67fd8cff2b0f ("cifs: Change the I/O paths to use an iterator rather than a page list")
>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>> ---
>>>   fs/cifs/smb2ops.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
>>> index 3630e132781f..bfad482ec186 100644
>>> --- a/fs/cifs/smb2ops.c
>>> +++ b/fs/cifs/smb2ops.c
>>> @@ -4988,7 +4988,7 @@ handle_read_data(struct TCP_Server_Info *server, struct mid_q_entry *mid,
>>>                                  dequeue_mid(mid, rdata->result);
>>>                          return 0;
>>>                  }
>>> -               rdata->got_bytes = pages_len;
>>> +               length = rdata->got_bytes = pages_len;
>>>
>>>          } else if (buf_len >= data_offset + data_len) {
>>>                  /* read response payload is in buf */
>>> --
>>> 2.27.0
>>>
>>
>> --
>> Thanks,
>> ~Nick Desaulniers
>
>

