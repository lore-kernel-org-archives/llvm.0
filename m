Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E53276410
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360031; cv=none; b=Pv5L+8ibJg+xCTzAnxbb5zR/70/AFjFBCTfBI0e3rcTYx9n+/EuKlqwEEaAWHPy3OUuEX6OgFuVWftG6O+Z3bEaiP4Yc30aXtQoxGI7TFjb4bZKo8y36owTdKMV4XQPcjheao9TaC8+Ph55CK2w/gLs5qx1GXy9x5s0f0pmFWjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360031; c=relaxed/simple;
	bh=zIXQs54wOkt+g84sKafsjr6B5ab0zZjTd7Fu5jvnxtY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WdtoMn/ufoFZDfvNwiOJalqHhZR4LEH8zlgC8ARvQe0Cmv/LdW6ixFmxFT4YVb2QYbNVYsHXgCX4AFDVuDHC1Wui3HqCdWcTopKHPgPy7RLtEnWl50DlbJqRkulfTsGciFj4FIDcK7UGTzfNyMPMLCRvYcDcT0m0R0fP0xa7OD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V1sqkVvM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V1sqkVvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/nghIdtU9VbvuDIBnGuioInqjHkSy06qHqf4wyYHUS0=;
	b=V1sqkVvMlolcYCiYKHtf+gIkGJNe/Ir1//AZddMzC1Qz0lbJspDPi+mN/V+ucrgnpMukz1
	bEx2pYN7iNwO3kIPCrlERrszyaWjFvaTe+5aycTKXBjBm1B77tI1rosGhg9ssHdSc7bk8C
	SHjypF+k2FoorQhYZo1a/yPWVQO4Jy8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-noyxS1vcPp2enIVf2wlU-g-1; Thu,
 26 Sep 2024 10:13:48 -0400
X-MC-Unique: noyxS1vcPp2enIVf2wlU-g-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3DE7F18F8A32
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:47 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F123A3003FD2;
	Thu, 26 Sep 2024 14:13:46 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 18ba6034)
Date: Thu, 26 Sep 2024 14:13:46 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <48344.124092610134800411@us-mta-679.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'nfsd-6.12' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/cel/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1465687953

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1465687953-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1465687953-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1465687953-x86_64-kernel-debug


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

