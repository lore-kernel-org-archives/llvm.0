Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA19714F98
	for <llvm@lists.linux.dev>; Wed, 28 May 2025 02:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748400128; cv=none; b=A7QKxsGGlQ6XHF1vTWR13JIzJARrHM/A/GOXpM/DRTi7fQO+mFA5CtzEH2013CaMfUNXYgtNzbjNZkFsRlHIkIVr+4a/zV/LWES5ZI1+RPemG96EuzCtHiuPBh9Iot0Q4uxR51ApTiDZZFonUVf6DF6S/9b78pnIdGGHaaQuwtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748400128; c=relaxed/simple;
	bh=tZk+hHnD0z8uYb0XL3cdTOf9p3EcoouMvv77LhkOysA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lL3ge0bTBhQmsP44/6nzcmD/v9dm9tQtPbq4evaU6Li0QFnseI2XBs1gram/hfhGseEG3c8CMS5e/OpPWPOaf2uV2Zt1wNj5Bh2gI3JmHSUkyWdkdlCQmeqoefOV44qey2LsT6As2vSRRcr5kVxcJlaKpWOQQGp2/3Bs4C+cMWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TF6D/iMb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TF6D/iMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748400125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uejdKcsvgGmouySdjlBdps7mrRuHBOENCcD7Mdy6n6E=;
	b=TF6D/iMbGIbJyceoUV/Pny6z4bwZS4NAXWnPcBQoNZZHjFhmeL4cOokb+UqAb6cVcsrudj
	01WUYXQyzPBJmanU967tAL75TeXq/9yCkJxfJ7nl+4XNXVDDzDkOgFHQwrbYZaR8Vx3UY1
	dX3ZvVOnZHE5sqDTz6+voprIAoqdrCQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-N0iFG2RQNxmFEqCbZQOHrA-1; Tue,
 27 May 2025 22:42:04 -0400
X-MC-Unique: N0iFG2RQNxmFEqCbZQOHrA-1
X-Mimecast-MFC-AGG-ID: N0iFG2RQNxmFEqCbZQOHrA_1748400123
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 66AEF1956086
	for <llvm@lists.linux.dev>; Wed, 28 May 2025 02:42:03 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 18A0219560AA;
	Wed, 28 May 2025 02:42:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0,
 upstream-mainline, c89756bc)
Date: Wed, 28 May 2025 02:42:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <99917.125052722420400233@us-mta-671.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EpgErviKuuNfEY6SKe-3VAb4Xqti1w8oZeD3Cz5UqwU_1748400123
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pm-6.16-rc1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1839868610

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1839868610-x86_64-kernel-debug


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

