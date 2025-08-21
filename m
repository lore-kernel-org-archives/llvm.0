Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA9E3375C1
	for <llvm@lists.linux.dev>; Thu, 21 Aug 2025 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783066; cv=none; b=Dt9dOqYeh5RCgLl+1JirQFiPtj6xNC0N79mDOxuOKEwCYNIEynqgmFCJjbYZAUb+Eis9oGXv3aTkrzZh913srsOCbSGJPoT9vgPUmfiAAQTEogDzoCmvgVTEfh/Goe3XtJIvND9+emRxNsbv7XFeNTPUy+z9iO3dBMtWu7bTNAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783066; c=relaxed/simple;
	bh=RP5dVFmHPG48IjhZ/9yhzNL7eBUNHNBUkKojWba0tu0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lwYuv33KR/85LT+tXeMtMvSjTV8P18CjIxH6XZFAmPIG2LxMESU1eUzKsoEMyyVriPS14HVLTPlF/qBpBhmExkr0JQxYdXqZn8nnbOsb8dAqi23lmYQLAutJUoNtJ/PDqFBlfUG2EsCqUkuuMjZSnfLrkrIHAk8XP52iszTD9oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KlCGRUSz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KlCGRUSz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755783063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JP8pzjmoPv7tpsia3lTCZplysseaBZpoMC/ubCWRqIU=;
	b=KlCGRUSzHG4HscJL6CfgHkBWNJrTYmNlABbdzypNg1IV5SVMZS0qKLyf6WWlIDS1q7Muhp
	558Fb5LOaumIjqQWLAd98UrrE6vqFyw9UX0FhhKMTw5LYKuYf3cDkXWRSh5FEVDYbACFVW
	qn+M/DJdZQieb6k5sp848F1H+GHWyOs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-eGcLl4XhNKmmwQ5OZHNH9g-1; Thu,
 21 Aug 2025 09:31:02 -0400
X-MC-Unique: eGcLl4XhNKmmwQ5OZHNH9g-1
X-Mimecast-MFC-AGG-ID: eGcLl4XhNKmmwQ5OZHNH9g_1755783062
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AEF8F180036E
	for <llvm@lists.linux.dev>; Thu, 21 Aug 2025 13:31:01 +0000 (UTC)
Received: from [172.20.48.110] (unknown [10.30.45.91])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 31B8F180029C;
	Thu, 21 Aug 2025 13:31:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc2,
 upstream-mainline, 32b7144f)
Date: Thu, 21 Aug 2025 13:31:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <02711.125082109310200809@us-mta-84.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KBekY9oq7pIiJC6GzxM-B1f1gT84fHbxU9dnxlI5HG4_1755783062
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'libcrypto-for-linus' of git://git.kernel.org=
/pub/scm/linux/kernel/git/ebiggers/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1996259453

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1996259453_aarch64_kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1996259453_x86_64_kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1996259453_x86_64_kernel-debug


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

