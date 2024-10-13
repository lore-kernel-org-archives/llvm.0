Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3662D7F48C
	for <llvm@lists.linux.dev>; Sun, 13 Oct 2024 21:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728853930; cv=none; b=SwCq2k+Cy819SOJzJt4a1HPGdq7SSXyZCwUcQAnK/o4u9mYPAPKNEfQyvLtFxzR8rfUYBqiWTwmkDrac3olPWSEJSfSZKbkDaf4W1iQmZE+iQyfSBwqQXH+wFjgHQXO2BCnXdrI3RHVrMvw7JVMFSx48yVh8n6IhwNa/ve+7B24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728853930; c=relaxed/simple;
	bh=YYXGAZXsOalgz1fza0GKmpcVsDdSA8PgrLI8gT4mKE0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=oZfzIQDXIhAYGNuPVUGTxiJm6D6o3uU6XssYhYakLOWfov8snhBfTTRxD5GCpBSXPv6NascYeSUS5mHiZnjGc809/6ZhwZMzy4DQ0dkFm47MuolGK29t2GqhX08QZ0o64LCwyJT6D3JNYYJQG4dCxTJ44w1Y/kIrR7WRoievO4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y66r6Pdx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y66r6Pdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728853927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nZ7LkSLIY0d3VdmiVQPsd2jLZ6W383VEn90ZgsDOwnA=;
	b=Y66r6Pdx9jY5+81xs0YwLgsi1EokND40dy+Ur6HY9iaVmysO6PDXNFBIdaLmB066ulzUDz
	lqlalInQUbrpiabWm4MNnF2C9QdqJX8vYrP9TIGT+6qw2CqIN+AQCFCTRJTkfv5jNRNkq2
	y/wbRZcnv9mkQGfa+h6LOzkkmD2voWs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-1heUYBdWOu6RKhp64Fff6g-1; Sun,
 13 Oct 2024 17:12:05 -0400
X-MC-Unique: 1heUYBdWOu6RKhp64Fff6g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F69619560AF
	for <llvm@lists.linux.dev>; Sun, 13 Oct 2024 21:12:04 +0000 (UTC)
Received: from [172.64.0.80] (unknown [10.30.33.131])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C560F19560AE;
	Sun, 13 Oct 2024 21:12:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc2,
 mainline.kernel.org-clang, cfea70e8)
Date: Sun, 13 Oct 2024 21:12:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <09167.124101317120500420@us-mta-640.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag '6.12-rc2-cifs-fixes' of git://git.samba.org/=
sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1494111126

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1494111126-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1494111126-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1494111126-x86_64-kernel-debug


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

