Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF64785947
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 19:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722282206; cv=none; b=CXtbSc/t7SvbwnZpaQKbMD9DfnopFzMl2YqYbOsEYUBgMh1PVKDZddA20avFxoyRAp8+8MhmYzcbsScQl8mlHx+ege8Vryz9WbNuh7TUjx4yKk7J9qdAmlByxlt364lW0CHS8MxKzoURhuFjLNlSfpXugrUfbYbDwwNbaO8ebPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722282206; c=relaxed/simple;
	bh=M8rWRxBENhn8daScejJoydIsIg22OF1/yOdvDxJYKqg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=qUfDhuUdZvVFDlXrpgCtL+3hzkX9aypP/Tyz79HZT8vj2rlra6/16CZUHeN+9E1/GfDVYv2X6NJMhfnrVCyQ/42uikv193Guu9jSbWqUdlgKsYeQQ2bx5NUIy4agIRbx+FP2S/Ta2lbxeX9ZI38v2pwjgh8dZJLmbXrnElg/seA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Psme1WkP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Psme1WkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722282203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0WCyaQtGTlH+bvTCNzN318jTjhdav1o5ai6OZji3T9o=;
	b=Psme1WkPgoT0VphdZbw8D6x5A+1h8J8XAJt99G+pplCj0B6RxbWXIM4zcX1Ex/KUvfHP85
	O+kTLjoFKTYT6JGBzk1iRH6KzFk6xpYpfgMoQP7dLcE4K0CL2+k3kyGbYstxqEQarXvYxs
	sqwpFsokY1zQFUFstZ/0kpePNghnFfg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-RXKvv0gSP2i1tp3Ozl1U1A-1; Mon,
 29 Jul 2024 15:43:22 -0400
X-MC-Unique: RXKvv0gSP2i1tp3Ozl1U1A-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA07F1955BF8
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 19:43:07 +0000 (UTC)
Received: from [172.64.1.77] (unknown [10.30.33.143])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 24F2F1955BF1;
	Mon, 29 Jul 2024 19:43:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc1,
 mainline.kernel.org-clang, 2accfdb7)
Date: Mon, 29 Jul 2024 19:43:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <87851.124072915432200744@us-mta-654.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: profiling: attempt to remove per-cpu profile flip buffe=
r

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1392563481

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1392563481-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1392563481-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1392563481-x86_64-kernel-debug


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

