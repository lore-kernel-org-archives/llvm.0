Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F5143AA9
	for <llvm@lists.linux.dev>; Mon, 31 Mar 2025 02:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743388931; cv=none; b=UjSaM9MCWQQbCq0Tt4kkFRk6ARUyXCmis/oirDVe9OeeY4FXW0uAOVNnIamqIa28cztX5+ycth/XyRuRxiG2vO+wUzQe1UGFUBEXvb8JIQEAYL4LQkLU2fLiGLzvn2Ob3aTl5P0rgBiuy6l65nt+UUUGHFB4elkTiehbSaTEr24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743388931; c=relaxed/simple;
	bh=ie9G42D7jGMyEQyjZB05Ebxj1PJlrz3oD/pyQwOy2no=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UWoBi6mEf+6KuwcbD5jhomHVUN436wlbodMcLJrRbBUwW86NsYhImwGBLg+Tnfx/gw91ASB2q01xkHpNaFIQyQxPwPqNMhDRhHubHn9Ro/6T4MSrUIDKj4Df8tvbZP4DQTC2sFceIEJ9soPQ9dcf3i6kcS/UohX2rtV5AkuuXAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YP3M06OU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YP3M06OU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743388927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gSOd7yISaCw9fqbQU86OKcHvqTsqeJI8ZSs17mxOjQg=;
	b=YP3M06OUXDZvm+MSIMl1eOq2jOWg0/Fhb3SEuL+91zCRNWnZNyfOKNiN7GYsUi/wo32Cj0
	JO6916cQCILRYTTdfqEzHZgPeNMO0ImvnDHg6zEr349E1coMwkmnS+4kj1Vzcu9JRnPOmR
	ZbonGkL2b9Vafcg/7b5X2yY//8FVA7I=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-eVHm6EiVP66U-MIyC0umEA-1; Sun,
 30 Mar 2025 22:42:06 -0400
X-MC-Unique: eVHm6EiVP66U-MIyC0umEA-1
X-Mimecast-MFC-AGG-ID: eVHm6EiVP66U-MIyC0umEA_1743388925
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F4491800259
	for <llvm@lists.linux.dev>; Mon, 31 Mar 2025 02:42:05 +0000 (UTC)
Received: from [172.20.107.51] (unknown [10.30.45.88])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF24530001A1;
	Mon, 31 Mar 2025 02:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 4e82c870)
Date: Mon, 31 Mar 2025 02:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <17647.125033022420600611@us-mta-679.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q3gbJcieieZ5vJWjKRmFmZLatCxTdUdShyeDdqnHb58_1743388925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'rust-6.15' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/ojeda/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1743695881

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1743695881-x86_64-kernel-debug


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

