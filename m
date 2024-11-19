Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E691C1F1A
	for <llvm@lists.linux.dev>; Tue, 19 Nov 2024 23:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060332; cv=none; b=HvxVtPE0EGkSsMngYMjpJi/6vK+JzYRPptgMvE6GI1ycM3tV5WcyPxX+qi779mqE5UENxHOMBgCLHyIROQCI4Z/pbcCeTLgfcCjQuDxFjRkBlToXQF9j9mZ35TnMuaeHfUv18WIGGRDCvjwO33m6BpEFzLvHz0Xl+P7tGNMuiVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060332; c=relaxed/simple;
	bh=dObAACSWb7Vk5cTWaoWFAkgNitlsi1XMJ3ESrwUhx7U=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=uBySpGrjuG96EsIh3Fnts9d9CSme0OqaYjOFML8oOEO+7GuEf5mKucvG7PEeGH86GAauOgUinzW11IRgZ7NvehnIy22pEGNXiZXAhULUq7W5QyQg5VLD8FkmpZe+xBkALof/pesx9uBx1diUwKMEvbapAoNDLioccVG9cfmnVNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NbNGlii/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NbNGlii/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732060329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u9vXZEEMbnB+mH31yrPfCAfQdKGzh2TKU454mS3sLpE=;
	b=NbNGlii/Ih3Exj+dat0tniqrADSOYFfY9B+DPYkG49J/w3TbzTAfsIwEUqXu+X6v/g+AQC
	AZqDruMeRA/7QS/1MhlntbhXBguzCXhC2/TF/Wncp4VJHRSO6N8wY7H0RMb5ShE4Ngzy61
	VJhgKx5qBudd+lyJmC1JcxyyfpXpanA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-164-whJADSS1OQ6UnAqwos9OYQ-1; Tue,
 19 Nov 2024 18:52:07 -0500
X-MC-Unique: whJADSS1OQ6UnAqwos9OYQ-1
X-Mimecast-MFC-AGG-ID: whJADSS1OQ6UnAqwos9OYQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E05619560AD
	for <llvm@lists.linux.dev>; Tue, 19 Nov 2024 23:52:05 +0000 (UTC)
Received: from [172.64.9.62] (unknown [10.30.33.134])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BE53919560A3;
	Tue, 19 Nov 2024 23:52:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, a5c93bfe)
Date: Tue, 19 Nov 2024 23:52:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <89344.124111918520700571@us-mta-164.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j3oCmtjpvPu3oStNf0ZIWHw1Alnt3l7j8aegdwb1XMk_1732060325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86-mm-2024-11-18' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1551711572

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1551711572-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1551711572-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1551711572-x86_64-kernel-debug


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

