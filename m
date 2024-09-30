Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00491DA3D
	for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727703205; cv=none; b=ENW4cuQH22vldrbTIVADhNUOY3DvyZmmvCil8ogS9qnAo5iLNoxuXNlJdkerKgGLeoOvzBijOgxvDDEuan1YDgl30nH5eEtYtJxo14QrDsBd395MGRTDJveWwDytbdgGq6xInQYkJbRut4EyE6i0xBzidGNwECeaqtGpz38e3VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727703205; c=relaxed/simple;
	bh=9ZCyaFPAhxvRpUueso2Dix8Wg2ytyKPXTEvuHd+Y9Ac=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Yy8r5Lod7IYa7Z+lr+SWh8BbyTtXojyhdblDASvatF7pivswpxna6PDWG+K2zulzZTxyYEronaOGH3d/JX5i9I9el5C3LkK1p4mdYaE7q7khtMCaesPe6+H9IEU8rY1Z7PJzTwxrsq17sq1x4N9bmMzG4uYesKFqORGQI2Qy5sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aoPcVWEd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aoPcVWEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727703203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Nuoxci3o14S6IePCBH8diJfdS7x6Tac9yDlfIvxenyw=;
	b=aoPcVWEdFa5M7Cj70yw5mSazo+X3fX35mA+rZr52QlYti5nw7jN8fso9KeimJenmlvylzH
	qtNx2doEG4Utnd/FI6LPPJxuoNXCeod+xcv1pd+nDdGKMLlY380uZOXQ/Fztjgql/ZhpD5
	wpw5nRDIC40eJy/LH0qjNp/9mj3PMLg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-631-MpVOmuNTN0Kw4IPdvEEbsw-1; Mon,
 30 Sep 2024 09:33:21 -0400
X-MC-Unique: MpVOmuNTN0Kw4IPdvEEbsw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BFC6018D9F36
	for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 13:33:20 +0000 (UTC)
Received: from [172.64.3.33] (unknown [10.30.33.101])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8A15E1979060;
	Mon, 30 Sep 2024 13:33:20 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, e477dba5)
Date: Mon, 30 Sep 2024 13:33:20 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <93802.124093009332102045@us-mta-631.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.12/dm-changes' of git://git.kernel.org=
/pub/scm/linux/kernel/git/device-mapper/linux-dm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1472795554

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1472795554-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1472795554-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1472795554-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1472795554-x86_64-kernel-debug


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

