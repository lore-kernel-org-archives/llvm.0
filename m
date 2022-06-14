Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1981FB0
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 16:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655225249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rsUXNxFSBPJLxuuSCdHvqhX854mWpjHL8UsxKW4ByL0=;
	b=EbGYCiYLWhJVDK70zfMQK3wWi5vbgtNhoJIc/gSWut3et0CM+G8rLmwlyJHZt/OYLNX8gM
	kUyWNLBkNWDN+UYRAhB/uoeYiBmw4ntcrdvleCsUe6AAjXympTOu/lICDaVodPKrs18Egj
	BiRxFjJWfhL9MgMnWHhqe8y2uHtbVm4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-MS9h4F77NrizwH_ULY9kHA-1; Tue, 14 Jun 2022 12:47:25 -0400
X-MC-Unique: MS9h4F77NrizwH_ULY9kHA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D210B299E75E;
	Tue, 14 Jun 2022 16:47:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C66E492CA2;
	Tue, 14 Jun 2022 16:47:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Gonda <pgonda@google.com>
Subject: Re: [PATCH] KVM: SVM: Hide SEV migration lockdep goo behind CONFIG_DEBUG_LOCK_ALLOC
Date: Tue, 14 Jun 2022 12:47:04 -0400
Message-Id: <20220614164703.1619648-1-pbonzini@redhat.com>
In-Reply-To: <20220613214237.2538266-1-seanjc@google.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9

Queued, thanks.

For what it's worth, GCC also produces the warning with "make W=1".

Paolo


