Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1761C6BD
	for <llvm@lists.linux.dev>; Mon, 13 May 2024 17:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715621243; cv=none; b=uBSZqRRXdjJPHHxHQDS16U3CFcrjgrhWaUB7nWm0h/ZW9yUOjBf2X9cY4VjJTfIkFxEUrbk8lPRv+n81YGqfDuaQfx5nJ7lbNCE8g+qjIIosORT3zsqOUi58hXMVejsjRLBsl8Wl+da++PfQc6zoRJvyTwEgqgUEDT7OPaqFSGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715621243; c=relaxed/simple;
	bh=4cY9MtXU2I4telm66R69VUj9RASu9tfSf8B/kojAaNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/fslfAB/utVMjAacP14nQGOq/QYd+hPEPgkNOvmdUUMFL/9napI7Ty0AxbrX1B6fURvuj9j4Czvpfg9Tox3hB+V0tC4PJhESs084WsYqQ/7eQOkC/1T1l/qraJEF1jzq8E8HSfp2GBPTOhRnuZfBLuB52d4g/3jJUGVBpOb6eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qor7EaBd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qor7EaBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715621241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lFetHttmrSPEk8iB/RIqp6UII+/zXMI6LYRqsBUqiFc=;
	b=Qor7EaBdH8s/AzcMRlMnVDsSlLZLPPQ2yLFWSmN9bnCk1ddfJO0TUuYvRh7szNSP+m8nra
	ZwYO0E0MfKIw3SeCVmDqgbykc323sAxYpVeOQxZAGuJryy4qRft6G8URuGTGZDLRPwkBum
	rwYarrphPmAWlXbx3EUVPD5KPSKCuDU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-uPV9H4_4NCmkmgs_ei13eg-1; Mon, 13 May 2024 13:21:05 -0400
X-MC-Unique: uPV9H4_4NCmkmgs_ei13eg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-41fc73366c9so26062625e9.1
        for <llvm@lists.linux.dev>; Mon, 13 May 2024 10:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715620863; x=1716225663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFetHttmrSPEk8iB/RIqp6UII+/zXMI6LYRqsBUqiFc=;
        b=S6PYRNFaKUBavP02cAV9uh2df/L4PFqGekdo5UWgE5bgnhMjsA/LXx5hy/2GOb865A
         kxTlv0fUIPZKLqPDMev5+6VT9oUegR4pd61vJzz2mXeegRKSkG2ChtN12l1T4FKw3zAb
         quwcvUWYD0O6iozBkI6c/EXeopz5lttOmgRdPaJzAn7nkTyyWLHQGN1AN9xCZzqprtKA
         Yo4LDKBevzUpiQ3vcYB9eBBXwD5dj2/na+jXgznC0+JuRbgQa/+MdZMRCZU1OC4sayCx
         gNONr8jKlY2ROKz+JxblZSo9a90gzojBceAwR4+whzIOwB8NDXPlvfQXj5Zxb2UIEsVp
         2GwA==
X-Forwarded-Encrypted: i=1; AJvYcCXbGN70Zw3Cz5kpO3qrr+zyVFHs5bO64B/RkiGYjTUYzHSTk+G5/qR1rLy93I1u/Co/C9HYrZQr/l8QmKgo7c15A0Pb2A==
X-Gm-Message-State: AOJu0Yx9fYZgubBO7I6DSnqUB4uMBpP7m9ZlJ840HZPepsqIUm/1f7SP
	cnxBBpEbw6NPwlxskU5a9J27FAkY/URFUN+MOJ/pVisSavA0LSxtvRkH6t7hEhT3yzNOzbCRn93
	gle8yWz2fgWzWmIp5oJUKF/sK2sXQytmpw8epiMJlb75jX1OjLoetxHs4Qy1ZUdQQnMJNKJwpah
	mo2K3PdSm3y/mgvFKi+oXf8EmMkw==
X-Received: by 2002:a05:600c:3582:b0:41b:143b:5c2d with SMTP id 5b1f17b1804b1-41feac55195mr86486975e9.28.1715620863710;
        Mon, 13 May 2024 10:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+7klRRXayuHxgQuN4xrnk2PibSO57rwQTkXNO9jJpJsh5eowNn5cZ4BTWrNPZBX2tLF3nvF6BA/OvQNnQl1w=
X-Received: by 2002:a05:600c:3582:b0:41b:143b:5c2d with SMTP id
 5b1f17b1804b1-41feac55195mr86486845e9.28.1715620863376; Mon, 13 May 2024
 10:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240510211024.556136-1-michael.roth@amd.com> <20240510211024.556136-19-michael.roth@amd.com>
 <20240513151920.GA3061950@thelio-3990X> <0ceafce9-0e08-4d47-813d-6b3f52ac5fd6@redhat.com>
 <20240513170535.je74yhujxpogijga@amd.com>
In-Reply-To: <20240513170535.je74yhujxpogijga@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 13 May 2024 19:20:52 +0200
Message-ID: <CABgObfY0SEjdnNbXqeFyht4FWSf8joW8-zVS1qJ8HrxR5D5AGQ@mail.gmail.com>
Subject: Re: [PULL 18/19] KVM: SEV: Provide support for SNP_EXTENDED_GUEST_REQUEST
 NAE event
To: Michael Roth <michael.roth@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, llvm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 7:11=E2=80=AFPM Michael Roth <michael.roth@amd.com>=
 wrote:
> Hi Paolo,
>
> Yes, I was just about to submit a patch that does just that:
>
>   https://github.com/mdroth/linux/commit/df55e9c5b97542fe037f5b5293c11a49=
f7c658ef

Go ahead then!

Paolo

