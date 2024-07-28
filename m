Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F276B3EA9B
	for <llvm@lists.linux.dev>; Sun, 28 Jul 2024 22:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722206592; cv=none; b=tKlCDb68S59GaCkD0KLYZAeYbUl0R9sBKxilkmlwlA+wRbP0jp9EtE36cUR3pED4bq4ADbWADLkRh53qpylAEZAHIJBP9P7Hg/jAi3y7dB/aC+quty+s2kW4AXPyiR1dxVzolGRMRr0KVlA6Z9ifUygmoKK/abNfKkXGppkobFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722206592; c=relaxed/simple;
	bh=SNZd1IV/Y3PBqBSShvU4o0ZY44HRcEqDaSwQqnKAhng=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lGgvZ7rEv++hRZxJY5igV4lC2rhhdXyhArEOAkDRz2m7rGKILllHBU9GoLCX5qwTDZqv6sfAzHfRCtiGGMaUrX6Fx55j1LK7ePqHu4gSn8HqvFLvPEzGCLKKUT61xuOuvYvP8WkuWzhJVOMxKu8cGHrocryG4BDSVXkVCDOclW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ERhWsdR8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ERhWsdR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722206588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wtveQ61VLCs96HZ8hW3IMN84ufRAW262AvTUfYqEkz0=;
	b=ERhWsdR8oNA9RVCZ/lwyH0GXOW9BU4PCsFkdDhj3H5yblJ8a34FGyLDjdFjh12bpZCeaVc
	yjjkWbMgz7Dd0rshU9P+nQFC4bjOaoLpyzmXG/ecGCo2jTQsvmMzb+qkxYV4J5Ll5fh7FP
	a4+i5/fgOZRGsLDWcQgx1XZVpDN9r4k=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-3QWLmaw-Mie24lXSk3923w-1; Sun,
 28 Jul 2024 18:43:07 -0400
X-MC-Unique: 3QWLmaw-Mie24lXSk3923w-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 108EC1955D44
	for <llvm@lists.linux.dev>; Sun, 28 Jul 2024 22:43:06 +0000 (UTC)
Received: from [172.64.13.36] (unknown [10.30.32.93])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3E6663000193;
	Sun, 28 Jul 2024 22:43:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc1,
 mainline.kernel.org-clang, 8400291e)
Date: Sun, 28 Jul 2024 22:43:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <16034.124072818430700269@us-mta-621.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.11-rc1

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1391231502

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1391231502-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1391231502-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1391231502-x86_64-kernel-debug


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

