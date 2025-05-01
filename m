Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAB21E991D
	for <llvm@lists.linux.dev>; Thu,  1 May 2025 21:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135130; cv=none; b=Wq0FXW9UIvJ9N15AyPS1+FHHZyvpopN0KgcnYQKFch013fMTkoCAkmPjaP3Ug+seeHNp6U1nLj+q21tJZBIqVRzordXo8a0HPlx2BhpI58gDSK+xu8ObDqN2UF8nimBgokokUQ7vi4DR+7mc7hH0MH0juSyBdoyxdbgH08lwwic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135130; c=relaxed/simple;
	bh=KmYAAhfHf0JCtih5r6elC+U2pbMuoTPiEzSg3zivqyc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=CbzfHjHFscXQMuCo12QySFwowq9yY8rj+EVlwgWOvtYcg2os2ZQ5TYKPXopGj5LVE5V6CUOIAmkdlq8qawnBgpC8jKkk0pqcLWy91kDu97dkO84lWaXH+LeTIn35racN4pXhsQdyW3qboqYXA/IAbvi+Qa6QQ5OAcaGro60VtTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cTykfBNi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cTykfBNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746135127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+35ahWGwa2xQnF2ROnDINTwhm6bdQYLbDcA8p59nE7Y=;
	b=cTykfBNiB8na9L4yULOeINdUFHxw/NUikp/YM9j3dtz3MvgnqSl1dSjMFnaKNfjVw5ga0A
	uyXZ2dCCg0Uvb+H9l3Jrm7PtuMQjVvmzz+HCqW/6oEwDdpUdNa3I6MKk5QwhwvPNthesqd
	CmG+iaiDFPvDOp4uAFQ+XI0bb1+dc/M=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-349-ISmlPh1RN-az6EG7lF9_eQ-1; Thu,
 01 May 2025 17:32:05 -0400
X-MC-Unique: ISmlPh1RN-az6EG7lF9_eQ-1
X-Mimecast-MFC-AGG-ID: ISmlPh1RN-az6EG7lF9_eQ_1746135125
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B41B1800446
	for <llvm@lists.linux.dev>; Thu,  1 May 2025 21:32:05 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9E33F195608D;
	Thu,  1 May 2025 21:32:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc4,
 upstream-mainline, ebd297a2)
Date: Thu, 01 May 2025 21:32:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <14887.125050117320500613@us-mta-349.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A2D80ocls9sfrQtJyk10bqWHx253n-m58XovHwsgRC8_1746135125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.15-rc5' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1796430815

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1796430815-x86_64-kernel-debug


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

