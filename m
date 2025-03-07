Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C431A3BA1
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741333391; cv=none; b=e1eyjDPJ8MYBMkTTZgdutFiTYm13pINEH27bC3fKDblMWHWiCQQ3ef/HVB14nBCpsaKStsp1iIaIzn41A2JfI34pNkChahC41bo030Y6v9s0eaWeptNYp0V2n3GUbABbvVvrtDk4zXqkvkflvRzRnxpntxU01Fc8ZSwqTyMqIDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741333391; c=relaxed/simple;
	bh=PajHfsDGCVHRrYM8KDX/mRfLtq+6Ac+e1UEgHCG7dbA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ghMNJ/DZV2dlm5E8amVCYk4VHvuCB7GySfBZ/PlQzQUcb6t9baSsAuMUoojG3V9hvOT9eB5GK4ztMMvLBzVMybbSnHxDqMhKRRK6+dQ9xb0Y521T3yqnkkPbU/FGXmTzOosIGrV8+fF0HpPBAN3P+zaWabwQYOI5uovjYmuhdDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RCd0BrX6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RCd0BrX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741333387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=StgrGxPjJSq1khkYaX2pfD/908h1EPMSTzVDL8BN+vU=;
	b=RCd0BrX6Zbis5tYn9euKg0XXbBjmbR/p7sPLUqnGMhGtMk4hCUkBOpWWmjy+gMpVXMJC+u
	TQFhO3fCcDl/74uYDhq5RG3tIF3x5isdJmuS+3zcF5QGmw9dfYGrla7hJ1NnK7NdaRof1Y
	7DlOxHPaIJJwNFcjzDVD4yj/OeSFC/I=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-3wYcsriGOmi9v0xEpCeByA-1; Fri,
 07 Mar 2025 02:43:06 -0500
X-MC-Unique: 3wYcsriGOmi9v0xEpCeByA-1
X-Mimecast-MFC-AGG-ID: 3wYcsriGOmi9v0xEpCeByA_1741333385
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54A8D1800257
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 07:43:05 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E9C9018001E9;
	Fri,  7 Mar 2025 07:43:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc5,
 upstream-mainline, f315296c)
Date: Fri, 07 Mar 2025 07:43:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <25924.125030702430600361@us-mta-210.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A59Qb6VwODtHtFf-FcEQIWvUFoG-AzKua6E3spvsqjA_1741333385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.14-rc6' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1703925967

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703925967-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1703925967-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703925967-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

