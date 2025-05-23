Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6691D1AAE17
	for <llvm@lists.linux.dev>; Fri, 23 May 2025 19:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748028188; cv=none; b=tgYzZtWLV51K1lIMu6QQcILXG98i9LftShk2Oo+eVK12ZkFYM3NAwIp/qDekJzIAgf8LMz44WE8TScEx7ojtGaM9lnX8RWp0Da8QH7Q3IdlbTW30+4okMiG4FRfOHtcNkpyT7rPiFOHxLVOBuniiHzEwILqXpCiZWLblq/aE8w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748028188; c=relaxed/simple;
	bh=D29jrsj3sA87ADhhi9EuH0riuzbY/J/gOJEhJV4CTus=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=cpbbvJNCJvNGCIOIagX4186Z9mfMRR9PsiSuKdDZbRC/T/x/u/bHqXUNlNr6ioEgqJwtFup8rUVB9YgsM7MUrxHA4gugQ75wDRBTd0JisUwx+UOKQXm+2GTC07h4C01MiicaVZIV66Fp2jxg6AKT/LiOacyMB/ftyLYjvqfnadE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZEuTyvDy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZEuTyvDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748028185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/p13mLGuyMVC9Bo4zq5ve7psm7hx5seL03o8zUyNK2M=;
	b=ZEuTyvDypTZNUYIO5wFOaCw8GdFaO0DKz8f57Hf+Q4w25RgYfMvJB18QFaDCPixrupDS0p
	gmY6bPdSB1hlDyXyGVySHUrwAJx4wTZvw5oqhSOjpYdB9kcIq7E30QUrFyElLhF4smNXJA
	wHs6PsQiE1l4x8OuOnliyQbqE+Q5CAY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-369-lrn5jqZsM_K2KhnTNO-KkA-1; Fri,
 23 May 2025 15:23:03 -0400
X-MC-Unique: lrn5jqZsM_K2KhnTNO-KkA-1
X-Mimecast-MFC-AGG-ID: lrn5jqZsM_K2KhnTNO-KkA_1748028183
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BE92E180048E
	for <llvm@lists.linux.dev>; Fri, 23 May 2025 19:23:02 +0000 (UTC)
Received: from [172.20.77.114] (unknown [10.30.44.38])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5439A195608F;
	Fri, 23 May 2025 19:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc7,
 upstream-mainline, 7586ac7c)
Date: Fri, 23 May 2025 19:23:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <99682.125052315230300394@us-mta-369.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8bEvCEfJ0t0jjFu_VXDs3AOcfZUYrO1osrsOH-898d8_1748028183
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'thermal-6.15-rc8' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1833750434

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1833750434-x86_64-kernel-debug


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

