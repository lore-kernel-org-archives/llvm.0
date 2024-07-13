Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E841EFC0B
	for <llvm@lists.linux.dev>; Sat, 13 Jul 2024 03:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720839730; cv=none; b=e9m/yVrJNxXjp68/2RO+cKQmclElYpAKD6ze+OjBA1qqGQsy2jvjjtJiD7qUDRAGhZn1QkAQOP2EyPur45xgYRruHwvXBsug7vsXHaBfKBPNPRyH2uY1wgRxWfx7kiyyekMzvKw7RXP6iJDxd877/g1Hlk8Ow/HOmnENZWo9EiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720839730; c=relaxed/simple;
	bh=rfuXTLTLGjGssAe42NSb2m9kDElzcSwakuBKQvugwTo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=orIrkTOHnX64KQY+TVgodJ5JJPBrwfC8Jcxo6EzuCE053XvtUNlyQHDYsTHAl+9mvdGa1hh5CELEyrMUEM8lxc0LxC8pazvPAUGIGtEHP4mbbLOq4nyLrX4T4xYKnBHt4n4/FrakZhS6t20AaXE2Br8VDlKq6qpj8Jt11UVxJHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=brA6AkJu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="brA6AkJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720839727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5vcQHWEg5NjvYN/OjXjTwOLZ35GlmBzATnboTVdKHVs=;
	b=brA6AkJubsYIGxZ4G0EcsDQe5Tc+jMkcRUcEu0F//uLGp5UNoW2FtCXpLbJxUZ+cLGNInc
	XxiWVWjdw26SQwZzVxCiZToE1VBwSpyuo18M1pMnjZPJraGUWMnL1+YN4Ehm7sgCrkVqxf
	Evy/G2mIYAIl8fTTtx/JBXWTTuiXcQs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-l13DsGijO4K0b7cwl9TTQA-1; Fri,
 12 Jul 2024 23:02:06 -0400
X-MC-Unique: l13DsGijO4K0b7cwl9TTQA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CB6819560B0
	for <llvm@lists.linux.dev>; Sat, 13 Jul 2024 03:02:05 +0000 (UTC)
Received: from [172.64.15.30] (unknown [10.30.34.46])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9558B1956066;
	Sat, 13 Jul 2024 03:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0-rc7,
 mainline.kernel.org-clang, 528dd46d)
Date: Sat, 13 Jul 2024 03:02:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <47979.124071223020600857@us-mta-637.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.10-rc8-2' of git://git.kernel.org/pub/=
scm/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1372070272

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1372070272-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1372070272-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1372070272-x86_64-kernel-debug


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

