Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D98A214A8A
	for <llvm@lists.linux.dev>; Thu,  8 May 2025 21:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746740590; cv=none; b=RQZubkAHtl3Mo/ga24kw+6NTxWqMgA2Fr/4bQcI0DnhtEQ4qXAIwyDVveowoLnxcb9RqgUK6NVDsj+zd/zWfnfoVqiLVu6B6cNffHMAtTZ/LApLsTDUfFN7wzF7T7rfSeJ9/PPcUA8eEpMNS9K528fsFoZgFRXyoiuukFnqUhIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746740590; c=relaxed/simple;
	bh=cTu5oRmvcsJa3hojLcu6gHKXEx2wguBAPdHLfqZwEh4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mVPj4+5tHtyJfcykYmXQy1WVn2n+3GaCNntYz9RMa5qYCERmJlMzXYiOLcSkGoWSsWXBF7wKY65uRNFigGJozewehlxKiwPknr108Q4jGRwehvdk2RSlUbf3GM4DVITprF+fU8LutoslpfkoDZ5jLRw4YPq47/+UydgzH9rJPnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PbvhI8wQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PbvhI8wQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746740587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HJvaLyaB5BYmMjodTeanZOYeEvJIhVC//hOenSpaHS4=;
	b=PbvhI8wQGj2Tj0JcMKv3+I6PziNu2s5F6iule+fLu5/sys49ow5WqQPbO8eRTkx2ueTueo
	UlhNCA+QfVk7haxCGEg6u4fUWJ6Icrda/FayEvll04Unc+T475tA8sYr/Cv81beVvoIS4n
	mR495YWGWnsOFpghXSLOxwFRvh7+ybI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-K7eaHw9POn60RG97AC5rSg-1; Thu,
 08 May 2025 17:43:06 -0400
X-MC-Unique: K7eaHw9POn60RG97AC5rSg-1
X-Mimecast-MFC-AGG-ID: K7eaHw9POn60RG97AC5rSg_1746740585
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 44B501800446
	for <llvm@lists.linux.dev>; Thu,  8 May 2025 21:43:05 +0000 (UTC)
Received: from [172.20.110.75] (unknown [10.30.44.189])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1052B1953B85;
	Thu,  8 May 2025 21:43:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc5,
 upstream-mainline, acaa3e72)
Date: Thu, 08 May 2025 21:43:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <50877.125050817430600187@us-mta-402.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eBY9yAKmzYYReSsITE0DzRkcV8f5tr7h3eekn4-HoKA_1746740585
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'vfio-v6.15-rc6' of https://github.com/awilli=
am/linux-vfio

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1808157571

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1808157571-x86_64-kernel-debug


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

