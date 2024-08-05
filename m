Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E32136330
	for <llvm@lists.linux.dev>; Mon,  5 Aug 2024 23:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722898931; cv=none; b=kV6/IflaNNqBiPddkrtTSjDQ8vAEA9PJzKDuj8K2MpWwAw3wwl+chk3R3iVD4uF+yzXqWMYRXhMDX1BOon29OEceoB2kDIS/9niE9TfSeOR2eLtZxOeeF7WkNOqaUGZP96B9AFk17B3vYv/X8obBeMzjch/LGBdqa6UvSSb1g4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722898931; c=relaxed/simple;
	bh=YKNaJLa12b675F3OO/hs7CF4VqIAFCsy+cAFLtDz+t0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=N2Frc3fF91ree0jemHZJ/JWRZE+4MeoX9SxrpVJFVmja/O6gxu+VUCz3qjESboELr1JvBzV8t7arvGjjRIbIJMcuekbny9872LiGg4C7zm7b6MX9vEHA8NOYaqdlI8Y+kpP6MPE0UMySXpeOnNXsJWMap2C/YduC7V+e7mGDsLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ho9LMCKl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ho9LMCKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722898928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2J7YsYgZ5Owa5FrHiWKSJzIylQLeqMF99zsfiF6dOr4=;
	b=Ho9LMCKl0T7I9JC2KIeFPKM7GP+YuCiRRyI+Aetse0p2SKVnijlh3rkA9KMku3cDHOffdn
	IUc4pb7TtSi++zmD+d0ET67FFLBNbMmJVpnCqkE/dpYzXCX4eNsi+uHfCDBtWZsqeyMI7M
	7nhucN0P6uS0toD2GhfXNKq9G63CEUk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-532-sPRhwpV3MvKZ33eWEVkJkw-1; Mon,
 05 Aug 2024 19:02:06 -0400
X-MC-Unique: sPRhwpV3MvKZ33eWEVkJkw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9912019560A3
	for <llvm@lists.linux.dev>; Mon,  5 Aug 2024 23:02:05 +0000 (UTC)
Received: from [172.64.15.28] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0898230001AD;
	Mon,  5 Aug 2024 23:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc2,
 mainline.kernel.org-clang, b446a2da)
Date: Mon, 05 Aug 2024 23:02:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <56415.124080519020600255@us-mta-532.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'linux_kselftest-fixes-6.11-rc3' of git://git=
.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1401753499

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1401753499-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1401753499-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1401753499-x86_64-kernel-debug


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

