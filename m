Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC308C0E
	for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 18:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745865192; cv=none; b=ZZSPwDpFJxR9QggVZWQWnrPkXTnY28qvObKevxb7SVkzF7HsX60LoBtQPyt6daFlnq1+uhOgqgNO6DGIl28JsjO2FKzfsHTLz+/s8z5dZeA/WeLRakawsO1RzaHLr1bGO/s+sX+t3d6FisF5qzM2IotrBZ9Lua5bh7IXt14haBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745865192; c=relaxed/simple;
	bh=L4e74jwyQvzmyK2XpUnlLpvic2I7manVHA5cN57aeLo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=JDu69E1e8zIu3x3IQut2VO9xbQBp83f1SEAOVqBMca8FXxShYHHShYf76+AbyllwHgrhhtPIQFdP5U2EOV4nrm4cu7S1K0XHST33exYvw6sTjgjt0i9d6t+S7fzR3DA8IcQscoM5piy6WxdU4hMC5CUpu6SLfyTn2X/DHZMaq+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Swns01Jg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Swns01Jg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745865190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y7H2zmik0mZIyEhyMFTabENZ5jcP4rshA8xSZJrrQjE=;
	b=Swns01JgHe0TdJxX6Nft4j1m41WVRRu1iEa+r2bsX7pDkWHg/KTHl6IV+2LWw/2HwBC3Qz
	XgQz+ZGE59w7ut2n5qVC3wpR2s2ayKjfnvRzvYScDBW+2+29iBh6UaG4AZvOudGJG/ylxz
	/9IUiZL+Q4le7LdiAMQmL7/orXTmq58=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-183-1RbEFXhVOeuv139y8XIgaQ-1; Mon,
 28 Apr 2025 14:33:04 -0400
X-MC-Unique: 1RbEFXhVOeuv139y8XIgaQ-1
X-Mimecast-MFC-AGG-ID: 1RbEFXhVOeuv139y8XIgaQ_1745865183
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A6C51800876
	for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 18:33:03 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 04DDA195608D;
	Mon, 28 Apr 2025 18:33:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc4,
 upstream-mainline, f15d97df)
Date: Mon, 28 Apr 2025 18:33:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <14081.125042814330400657@us-mta-183.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 32DPe5XnheGLln7G8_Ptc0_rLf0YQJ3PZ7fCEAwM-H4_1745865183
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'powerpc-6.15-3' of git://git.kernel.org/pub/=
scm/linux/kernel/git/powerpc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1790536074

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1790536074-x86_64-kernel-debug


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

