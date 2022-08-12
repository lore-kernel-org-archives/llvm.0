Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB68E626
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 07:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660291085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=dj2bXyw69Ca1K4Y6juCkgJbZvwbNi5nv6jrOQoviFpqbOho2M2HwM8FISjJnvxp1ROoikM
	2r5BpYsIxJjn4lSpaF6A0ZYFUKwwYh7WGGpUlONUl2mYFx3QH3EI7YUledjLX9fr3Ax0fO
	0hzhTzWkOALlkM41C7PbMR1K4W/WJkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-PeT3p9eYMt6n7y6obxaLKQ-1; Fri, 12 Aug 2022 03:58:01 -0400
X-MC-Unique: PeT3p9eYMt6n7y6obxaLKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C3838032E3;
	Fri, 12 Aug 2022 07:58:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBAFDC15BA8;
	Fri, 12 Aug 2022 07:58:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	David Matlack <dmatlack@google.com>
Cc: Jim Mattson <jmattson@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Oliver Upton <oupton@google.com>,
	Tom Rix <trix@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 0/2] KVM: selftests: Fix Clang build issues in KVM_ASM_SAFE()
Date: Fri, 12 Aug 2022 03:57:58 -0400
Message-Id: <166029101189.410868.1013034335296183657.b4-ty@redhat.com>
In-Reply-To: <20220722234838.2160385-1-dmatlack@google.com>
References: <20220722234838.2160385-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8

Queued, thanks.

Paolo

