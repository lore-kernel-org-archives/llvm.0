Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D721513632B
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360009; cv=none; b=Afifpelq+i+4/VOnzXEqe74twyr7MkvLaRuaYLG/0juPNh1INP5/0hI36SiP9RNbu9fFJB/tnyKT2NIwVtx3RdaKmQpbRk7jdbD76n6E+djfAPQO+Q1/Pr/JB70trBfpuTTIlRzldf9CS7GoYnx/Ck8MqTp31iRwpCAfVKqq9cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360009; c=relaxed/simple;
	bh=yzWf7P5eEZCEu0S40JPX7Ug798eyRxlAPN9dGOqjK5w=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=O3JKmy/DK5RYwzhm/Sgt/yCxTwuB2+ID7yQ8gAwabse4w7HSYw+rP3sViHY5UIEMfMBN1N06ZCf8E5NfMDxf3+Y/Iqtxm4WjDdk57CDhMe0YgM/0hEcN5I4lgO1eQ+eDG5i+1KTt2fxdoncYuxCPqdvbvSnNbiQuPRhDrivy03c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h1OdH9vB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h1OdH9vB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IHMWW6LmIkDNojgCGoMrVFoGUTswt4wIYNEOC8MqBfg=;
	b=h1OdH9vBzf8OZq2xNtIHDOPuVAqfekcornptjZR9YhwiKt5gsQ4AcRZTHmWGjBiAyj6WIZ
	40OTwMDyjoaNouQsHT9ajt0+WAWl0+3QZunaWoV5ckg0bdlOwCygnPz9f+38yDs8evnlc1
	m63omix+f2W56K3wzvYmhPXCC9+6FpE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-211-cY4InY9jNEqA_-jPXubxFw-1; Thu,
 26 Sep 2024 10:13:25 -0400
X-MC-Unique: cY4InY9jNEqA_-jPXubxFw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC3351943CFB
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:24 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 647F71954B0F;
	Thu, 26 Sep 2024 14:13:24 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 68e5c7d4)
Date: Thu, 26 Sep 2024 14:13:24 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <37400.124092610132501265@us-mta-211.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'kbuild-v6.12' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/masahiroy/linux-kbuild

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1467655245

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1467655245-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1467655245-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1467655245-x86_64-kernel-debug


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

